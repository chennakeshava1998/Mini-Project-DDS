This project aims to store passwords in Key and Lock itself - this reduces the possibility of fake keys/cards.
TEST.v is the test bench for the MAIN module
Seperate test benches can be found all the modules. The naming is t_<name_of_the_module>.v
Similarly, vcd files are also generated for some of these test benches.


Modules used :

MAIN : Combines all the other modules.
KEY  : Interface for reading password stored in the Key. Also used for writing the new passwords into the Key.
LOCK : Interface for reading password stored in the Lock. Also used for writing the new passwords into the Lock.
RPG  : Random Password Generator. Using the inbuilt function $random in verilog, random numbers are generated and used as the new passwords.

PASS_CHECK : Module that checks if both the passwords match. It also changes values of readLock and readKey - enables writing onto Lock and Key.

TEST : Test module for testing the functionality. This is mostly redundant, as most of useful messages have been used inside the above core modules itself.




Variables used :

keyEnable : Variable used to check if Key has been inserted. Also used to ensure only one new password is written onto Key and Lock even if Key is left in the same position for a long time.

readKey : 1 ==> Password must be read from the Key.
		  0 ==> New Password must be written onto the Key.

readLock : 1 ==> Password must be read from the Lock.
		  0 ==> New Password must be written onto the Lock.

unlockDoor : 1 ==> Passwords match and door must be unlocked.
			 0 ==> Passwords donot match.

keyPass : Previous/Original password present in the Key.
keyBuffer : temporary storage for storing the new Passsword.

lockPass : Previous/Original password present in the Lock.
lockBuffer : temporary storage for storing the new Passsword.

newPass : New password generated from RPG.