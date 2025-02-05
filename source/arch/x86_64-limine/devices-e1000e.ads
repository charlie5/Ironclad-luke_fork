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
package Devices.e1000e with SPARK_Mode => Off is
   --  Probe for e1000e nic's and add em.
   function Init return Boolean;
end Devices.e1000e;