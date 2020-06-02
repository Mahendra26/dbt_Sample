##dbt (Data build tool)
- 	It enables analysts to orchestrate the entire analytics engineering workflow in their browsers and to transform data in their warehouses by simply writing select statements. 
- 	dbt handles turning these select statements into tables and views which can be modified in dbt_project.yml under [materialized](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/materializations/) properties.



|Multiple sources|-->|Data Loaders|-->|Raw Data|  |Transformed Data|-->|Data Consumers|
					  |   	       |
					  |----|dbt|---|


- 	dbt is a tool to help you write and execute the data transformation jobs that run inside your warehouse. 
- 	dbt's only function is to take code, compile it to SQL, and then run against your database.
- 	It automatically builds a DAG (Direct acyclic graph) of all of the models in a given dbt project.

####Further is the repository structure of directories created in dbt to perform transformaton.
	A dbt project is a directory of .sql and .yml files. The directory must contain at a minimum:

####Data:
1. 	All the csv files are kept in data directory, if we want to load the data using these csv files then 
 	we can place these csv files in data directory and run dbt seed command.

####Macros:
1. 	The functions which we need to call at run time are created and stored in macros directory.

####Models: 
1. 	A model is a single .sql file. Each model contains a select statement that either transforms raw data into a dataset that is ready for analytics, 
 	or, more often, is an intermediate step in such a transformation.
2. 	Models further conatins sub directories in name (Stage, Core, Consumption).
###### - 	Stage:
	   This sub directory contains all the sql files which are to be executed at base level.
###### - 	Core:
 	   This sub directory contains all the Intermediate sql file which are executed by taking reference from stage level sql files.
###### - 	Consumption:
 	   This sub directory contains final sql files which are executed by taking reference from stage and core level sql files. 

####Project file: 
1. 	A dbt_project.yml file which configures your dbt project and contains all the information related to target, source, data, macros etc.
2. 	while executing dbt run command this is the first yml file which dbt refers to, If not found throws a error.

> An external folder is created just to store the [screenshots](https://bitbucket.org/phdata/dbt_data_build_tool/src/dev_mahendra/mahendra/screenshots/) for reference purpose, dbt dosen't create this folder.

####Schema.yml:
1. 	This is another yml file which is used apart from [dbt_project.yml](https://docs.getdbt.com/reference/dbt_project.yml/) which is used to store certain configurations about test cases which can be verified by executing dbt test command.

> *dbt commands can be found [here](https://discourse.getdbt.com/t/what-are-the-dbt-commands-you-run-in-your-production-deployment-of-dbt/366) *

