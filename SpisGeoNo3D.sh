#!/bin/bash

START_POINT=$PWD
CMD_LINE=`dirname $0`
cd ${CMD_LINE}
export LD_LIBRARY_PATH=./dependencies/thirdparty/jre-1.8.0_73-linux64b/lib/amd64/xawt:$LD_LIBRARY_PATH
NOW=`date +%s`
while getopts p:b:hm option
  echo ""
  
  # test if an argument exist
  if [ $# -ne 0 ]; then

    # test if more than 1 argument exist (used with -h or -m option)
    if [ $# -ne 1 ]; then

      # Compute the path where the command is launched
      if [ ${OPTARG:0:1} == "/" ]; then
          # the argument is defined with an absolute path
          PATH_CORRECTED=$OPTARG
      else
          # the argument is defined with a relative path
          PATH_CORRECTED=$START_POINT"/"$OPTARG
      fi

    fi
  
  fi
  
  do
    case $option in
        p)
            ./dependencies/thirdparty/jre-1.8.0_73-linux64b/bin/java -Xmx2048M -jar -Djava.awt.headless=true -Dspis.timestamp=$NOW -Dlogback.configurationFile=resources/logging/logback-headless.xml -Dfelix.config.properties=file:resources/felix/config.properties -Dactivate3DViews=false -Dorg.keridwen.config=./resources/org-spis-geo-linux64b.properties -Dorg.keridwen.headless=true -Dorg.spis.batch.project.path=$PATH_CORRECTED dependencies/thirdparty/felix-5.0.1/felix.jar
            exit 0
			;;
        b)
            ./dependencies/thirdparty/jre-1.8.0_73-linux64b/bin/java -Xmx2048M -jar -Djava.awt.headless=true -Dspis.timestamp=$NOW -Dlogback.configurationFile=resources/logging/logback-headless.xml -Dfelix.config.properties=file:resources/felix/config.properties -Dactivate3DViews=false -Dorg.keridwen.config=./resources/org-spis-geo-linux64b.properties -Dorg.keridwen.headless=true -Dorg.spis.batch.script.path=$PATH_CORRECTED dependencies/thirdparty/felix-5.0.1/felix.jar
            exit 0
			;;
		h)
			printf "Usage:\n"
			printf "* To run SPIS with its graphical user interface:\n"
			printf "$0 \n"
			printf "* To run SPIS in batch mode and execute a simulation from a given SPIS project:\n"
			printf "$0 -p path/to/project.spis5\n"
			printf "* To run SPIS in batch mode and execute a given Jython script:\n"
			printf "$0 -b path/to/jython/script\n"
			exit 2
			;;
		m)
	        ./dependencies/thirdparty/jre-1.8.0_73-linux64b/bin/java -Xmx2048M -splash:resources/images/splash_spis-geo-png24.png -jar -Dspis.timestamp=$NOW -Dlogback.configurationFile=resources/logging/logback.xml -Dfelix.config.properties=file:resources/felix/config.properties -Dactivate3DViews=false -Dorg.keridwen.config=./resources/org-spis-geo-linux64b.properties -DforceLAF=Metal dependencies/thirdparty/felix-5.0.1/felix.jar
	        exit 0
		    ;;
        ?)
            ./dependencies/thirdparty/jre-1.8.0_73-linux64b/bin/java -Xmx2048M -splash:resources/images/splash_spis-geo-png24.png -jar -Dspis.timestamp=$NOW -Dlogback.configurationFile=resources/logging/logback.xml -Dfelix.config.properties=file:resources/felix/config.properties -Dactivate3DViews=false -Dorg.keridwen.config=./resources/org-spis-geo-linux64b.properties dependencies/thirdparty/felix-5.0.1/felix.jar
            exit 0
			;;
    esac
done