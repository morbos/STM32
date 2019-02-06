typedef struct _tListNode {
	struct _tListNode * next;
	struct _tListNode * prev;
}tListNode, *pListNode;

/* structure used to read received data */
typedef struct _tHciDataPacket
{
  tListNode currentNode;
  uint8_t dataBuff[HCI_READ_PACKET_SIZE];
  uint8_t data_len;
} tHciDataPacket;

void list_insert_node_before (tListNode * node, tListNode * ref_node)
{
  uint32_t uwPRIMASK_Bit;

  uwPRIMASK_Bit = __get_PRIMASK();  /**< backup PRIMASK bit */
  __disable_irq();                  /**< Disable all interrupts by setting PRIMASK bit on Cortex*/
  
  node->next = ref_node;
  node->prev = ref_node->prev;
  ref_node->prev = node;
  (node->prev)->next = node;
  
  __set_PRIMASK(uwPRIMASK_Bit);     /**< Restore PRIMASK bit*/
}
