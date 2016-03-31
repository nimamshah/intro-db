
Quick Reference of commands to be used:

To Connect to Oracle (from the Unix/Linux command line):
 
% source /usr/local/etc/ora.csh
% sqlplus <username>@<instance>

Ex:  %sqlplus sally@orcl

To Create Tables (from within Oracle):  @createtables

To Delete Tables (from within Oracle): @droptables

To bulklod the data files (from the Unix/Linux command line):

sqlldr <CISE ID>@[instance_name] control=<ctlFile>

Ex: 

sqlldr sally@orcl control=loader.ctl
sqlldr sally@orcl control=partload.ctl
sqlldr sally@orcl control=climber.ctl
sqlldr sally@orcl control=climbed.ctl
