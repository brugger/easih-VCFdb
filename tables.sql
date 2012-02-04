#DROP TABLE project;
#DROP TABLE sample;
#DROP TABLE file;
#DROP TABLE qv_boxplot;
#DROP TABLE qv_histogram;
#DROP TABLE base_distribution;
#DROP TABLE GC_distribution;
#DROP TABLE duplicates;
#DROP TABLE duplicated_seqs;
#DROP TABLE adaptors;
#DROP TABLE illumina_sample_stats;
#DROP TABLE illumina_lane_stats;
#DROP TABLE run;


CREATE TABLE project (

  pid                 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name                VARCHAR(3) NOT NULL ,

  KEY name_idx (name)

);



CREATE TABLE sample (

  sid                 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  pid                 INT NOT NULL,
  name                VARCHAR(8) NOT NULL ,

  KEY name_idx (name),
  KEY pid_idx  (pid)
);


CREATE TABLE variation (
  vid                INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  chr                VARCHAR(10) NOT NULL,
  pos		     INT,
  ref		     VARCHAR(100),
  alt		     VARCHAR(100),
  score		     float,

  KEY chr_pos_idx (chr, pos)
);

CREATE TABLE annotations (
  vid                INT NOT NULL PRIMARY KEY,  
  gene               VARCHAR(20),
  transcript         VARCHAR(20),
  effect             VARCHAR(20),
  codon_pos          VARCHAR(20),
  AA_change          VARCHAR(20),
  grantham_score     INT,
  dbsnp		     VARCHAR(20),
  HGMD		     VARCHAR(2),
  pfam		     VARCHAR(20),
  PolyPhen  	     VARCHAR(20),
  SIFT		     VARCHAR(20),
  condel	     VARCHAR(20),
  GERP		     VARCHAR(20),
 
  KEY gene_idx (gene),
  KEY trans_idx (transcript)
);

CREATE TABLE sample_data (
  sid                INT NOT NULL,
  vid                INT NOT NULL,

  filter	     varchar(100),
  score  	     float,
  depth		     INT,
  allele_freq	     float,
  allele_count	     float,

  KEY vid_idx (vid),
  KEY sid_idx (sid),
  KEY sid_vid_idx (sid,vid)
);



DELETE FROM project;
DELETE FROM sample;