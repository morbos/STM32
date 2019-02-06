#! /usr/bin/python
import sys
import struct
from bluepy import btle
from bluepy.btle import UUID, Peripheral,DefaultDelegate
from bluepy.btle import Scanner

server_name = "MkAda S"

# 2 delegates, one for scan one for characteristic data
class ScanDelegate(DefaultDelegate):
    def __init__(self):
        DefaultDelegate.__init__(self)

class MyDelegate(DefaultDelegate):
    def __init__(self, params):
        DefaultDelegate.__init__(self)

    #func is caled on notifications
    def handleNotification(self, cHandle, data):
         print struct.unpack('Hhhhhhhhhh', data)

# First we scan for the server
scanner = Scanner().withDelegate(ScanDelegate())
devices = scanner.scan(1.0)

BDaddr = 0
for dev in devices:
    for (adtype, desc, value) in dev.getScanData():
        if (desc == "Complete Local Name") and (value == server_name):
            print "Scan finds: '%s' addr: %s" % (server_name,dev.addr)
            BDaddr = dev.addr

if BDaddr == 0:
    print "Not found!"
    exit()

# Scan was successful, now connect
dev_name_uuid = UUID(0x2A00)

print "Connecting..."
dev = btle.Peripheral(BDaddr)

ch = dev.getCharacteristics(uuid=dev_name_uuid)[0]
if (ch.supportsRead()):
        print ch.read()

dev.setDelegate( MyDelegate(dev) )

accgyromag_char_uuid = UUID("00e00000-0001-11e1-ac36-0002a5d5c51b")
sensortile_service_uuid = UUID("00000000-0001-11e1-9ab4-0002a5d5c51b")
sensortile_service=dev.getServiceByUUID(sensortile_service_uuid)

ch = sensortile_service.getCharacteristics(accgyromag_char_uuid)[0]
h=ch.getHandle()
first = 1
for descriptor in dev.getDescriptors(h):  # The handle range should be read from the services
        if first == 1 and descriptor.uuid == 0x2902:
                hccc = descriptor.handle
                first = 0

# Now tell server to send accgyromag data
dev.writeCharacteristic(hccc, struct.pack('<bb', 0x01, 0x00))

# Notification Replies (accgyromag...) are handled by the delegate up top ^^^^
while True:
    if dev.waitForNotifications(1.0):
            continue

    print "Waiting... Waited more than one sec for notification"


dev.disconnect()
