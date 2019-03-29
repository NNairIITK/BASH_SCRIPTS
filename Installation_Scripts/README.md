#           INSTALLATION SCRIPTS

         
 * **Authour :**
 
 		KAPAKAYALA ANJI BABU
	       	Dept. of Chemistry
	 	C.O Prof. Nisanth Nair
                IIT KANPUR, INDIA.
        
* **Plumed :**

		USAGE: sh install_plumed.sh  <zipfile|tarfile>    
	 
* **VMD:**

		UASGE: sh install_vmd.sh <vmd*.tar.gz|zip> 
                 **It need to be run as root admin**
		
* **AmberTools:**
  
  		USAGE: sh install_amber.sh <amber*.tar.gz|zip>
		
* **Mgltools & Autodock:**

		USAGE: bash Install_Autodock.sh
	* Description:  The script automatically downloads the mgltools & Autodock packages and install them.
		
	 
* **Gromacs:**
**[Serial | mpi | plumed-patched ]**
                   
* **USAGE:**

	   CASE 0: Need help ?
	   sh Install_gromacs.sh --help
	
	   CASE 1: Installing GROMACS patching eith plumed
        sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz -p plumed

   	   CASE 2: Installing GROMACS without mpi [serial version]
    	   sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz -m serial

        CASE 3: Installing GROMACS without patching plumed mpi version
        sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz 
	
	   CASE 4: Install Plumed with mpi (default)
	   sh Install_gromacs.sh -f plumed.zip -i install_plumed
 
                    
      Cheers  !!!
      Anji Babu
