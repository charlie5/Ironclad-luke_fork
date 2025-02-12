--  devices-e1000e.ads: SATA driver.
--  Copyright (C) 2024 charlie5, Lucretia
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
with Arch.PCI;
with Lib.Messages;

package body Devices.e1000e with SPARK_Mode => Off is
   --  Probe for ATA drives and add em.
   function Init return Boolean is
      Network_Class : constant := 16#02#;
      Subclass      : constant := 16#0#;
      Prog_IF       : constant := 16#0#;
      Success       : Boolean  := False;

      PCI_Dev       : Arch.PCI.PCI_Device;
      PCI_BAR0      : Arch.PCI.Base_Address_Register;
      PCI_BAR1      : Arch.PCI.Base_Address_Register;
      PCI_BAR2      : Arch.PCI.Base_Address_Register;
      PCI_BAR3      : Arch.PCI.Base_Address_Register;
      PCI_BAR4      : Arch.PCI.Base_Address_Register;
      PCI_BAR5      : Arch.PCI.Base_Address_Register;
      PCI_BAR6      : Arch.PCI.Base_Address_Register;
      Num_Str       : Lib.Messages.Translated_String;
      Num_Len       : Natural;
   begin
      Lib.Messages.Put_Line ("Devices.e1000e.Init");

      for Index in 1 .. Arch.PCI.Enumerate_Devices (Network_Class, Subclass, Prog_IF) loop
         Arch.PCI.Search_Device (Network_Class, Subclass, Prog_IF, Index, PCI_Dev, Success);

         if not Success then
            return False;
         else
            Lib.Messages.Put_Line ("Devices.e1000e.Init: Found e1000e");
         end if;

         Arch.PCI.Get_BAR (PCI_Dev, 0, PCI_BAR0, Success);

         if not Success then
            PCI_BAR0.Base := 16#1F0#; -- TODO: What to do?
         else
            Lib.Messages.Image (Unsigned_64 (PCI_BAR0.Base), Num_Str, Num_Len, Use_Hex => True);
            Lib.Messages.Put_Line ("Devices.e1000e.Init: BAR 0 found at: " & Num_Str);
         end if;

         Arch.PCI.Get_BAR (PCI_Dev, 1, PCI_BAR1, Success);

         if not Success then
            PCI_BAR0.Base := 16#1F0#; -- TODO: What to do?
         else
            Lib.Messages.Image (Unsigned_64 (PCI_BAR1.Base), Num_Str, Num_Len, Use_Hex => True);
            Lib.Messages.Put_Line ("Devices.e1000e.Init: BAR 1 found at: " & Num_Str);
         end if;

         Arch.PCI.Get_BAR (PCI_Dev, 2, PCI_BAR2, Success);

         if not Success then
            PCI_BAR0.Base := 16#1F0#; -- TODO: What to do?
         else
            Lib.Messages.Image (Unsigned_64 (PCI_BAR2.Base), Num_Str, Num_Len, Use_Hex => True);
            Lib.Messages.Put_Line ("Devices.e1000e.Init: BAR 2 found at: " & Num_Str);
         end if;

         Arch.PCI.Get_BAR (PCI_Dev, 3, PCI_BAR3, Success);

         if not Success then
            PCI_BAR0.Base := 16#1F0#; -- TODO: What to do?
         else
            Lib.Messages.Image (Unsigned_64 (PCI_BAR3.Base), Num_Str, Num_Len, Use_Hex => True);
            Lib.Messages.Put_Line ("Devices.e1000e.Init: BAR 3 found at: " & Num_Str);
         end if;

         Arch.PCI.Get_BAR (PCI_Dev, 4, PCI_BAR4, Success);

         if not Success then
            PCI_BAR0.Base := 16#1F0#; -- TODO: What to do?
         else
            Lib.Messages.Image (Unsigned_64 (PCI_BAR4.Base), Num_Str, Num_Len, Use_Hex => True);
            Lib.Messages.Put_Line ("Devices.e1000e.Init: BAR 4 found at: " & Num_Str);
         end if;

         Arch.PCI.Get_BAR (PCI_Dev, 5, PCI_BAR5, Success);

         if not Success then
            PCI_BAR0.Base := 16#1F0#; -- TODO: What to do?
         else
            Lib.Messages.Image (Unsigned_64 (PCI_BAR5.Base), Num_Str, Num_Len, Use_Hex => True);
            Lib.Messages.Put_Line ("Devices.e1000e.Init: BAR 5 found at: " & Num_Str);
         end if;

         Arch.PCI.Get_BAR (PCI_Dev, 6, PCI_BAR6, Success);

         if not Success then
            PCI_BAR0.Base := 16#1F0#; -- TODO: What to do?
         else
            Lib.Messages.Image (Unsigned_64 (PCI_BAR6.Base), Num_Str, Num_Len, Use_Hex => True);
            Lib.Messages.Put_Line ("Devices.e1000e.Init: BAR 6 found at: " & Num_Str);
         end if;
      end loop;

      return False;
   end Init;


   procedure Read
      (Key         : System.Address;
       Offset      : Unsigned_64;
       Data        : out Operation_Data;
       Ret_Count   : out Natural;
       Success     : out Boolean;
       Is_Blocking : Boolean) is
   begin
      null;
   end Read;


   procedure Write
      (Key         : System.Address;
       Offset      : Unsigned_64;
       Data        : Operation_Data;
       Ret_Count   : out Natural;
       Success     : out Boolean;
       Is_Blocking : Boolean) is
   begin
      null;
   end Write;


   procedure IO_Control
      (Key       : System.Address;
       Request   : Unsigned_64;
       Argument  : System.Address;
       Has_Extra : out Boolean;
       Extra     : out Unsigned_64;
       Success   : out Boolean) is
   begin
      null;
   end IO_Control;
end Devices.e1000e;