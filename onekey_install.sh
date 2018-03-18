#! /bin/bash

#URL config
fastqc=https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
bwa=https://sourceforge.net/projects/bio-bwa/files/bwa-0.7.17.tar.bz2/download
samtools=https://github.com/samtools/samtools/releases/download/1.7/samtools-1.7.tar.bz2
sratoolkit=http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz 
GATK=https://github.com/broadinstitute/gatk/releases/download/4.0.2.1/gatk-4.0.2.1.zip


# create work document
cd /home
mkdir bioinformation
cd bioinformation
mkdir soft ref-genome workspace


# install java
yum -y install java-1.8.0-openjdk.x86_64
#set java environment
echo "JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.*.x86_64
JRE_HOME=$JAVA_HOME/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH PATH">>/etc/profile
source /etc/profile
echo "java install success!">>/home/bioinformation/soft/install.log

# install fastqc in soft
cd /home/bioinformation/soft
wget -O fastqc.zip $fastqc
unzip fastqc.zip
rm -rf fastqc.zip
cd FastQC
chmod 755 fastqc
echo "fastqc install success!">>/home/bioinformation/soft/install.log


# install bwa in soft
cd /home/bioinformation/soft
wget -O bwa-0.7.17.tar.bz2 $bwa
tar -jxvf bwa.tar.bz2
rm -rf bwa-0.7.17.tar.bz2
cd bwa*
make
echo "bwa install success!">>/home/bioinformation/soft/install.log


# install samtools in soft
cd /home/bioinformation/soft
wget $samtools
tar -jxvf samtools-*.tar.bz2
rm -rf samtools-*.tar.bz2
cd samtools*
make
echo "samtools install success!">>/home/bioinformation/soft/install.log


# install sratoolkit in soft
cd /home/bioinformation/soft
wget -O sratoolkit.tar.gz $sratoolkit
tar -zxvf sratoolkit.tar.gz
rm -rf sratoolkit.tar.gz
cd sratoolkit.*
echo "sratoolkit install success!">>/home/bioinformation/soft/install.log


# install GATK in soft
cd /home/bioinformation/soft
wget -O GATK.zip $GATK
unzip GATK.zip
rm -rf GATK.zip
cd gatk*
echo "GATK install success!">>/home/bioinformation/soft/install.log





