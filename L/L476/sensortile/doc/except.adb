      LPS22.Configure;
      Acc.Configure;
      Mag.Configure;
      AccGyro.Configure;
      begin
         HTS.Configure;
         GG.Configure;
      exception
         when Program_Error =>
            Main.Set_Master;
            PCM1774.Configure;
      end;
