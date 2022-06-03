## Step 1 Install robotmetrics

### Case 1: Using pip

pip install robotframework-metrics==3.2.2 (from RF4.0)
pip install robotframework-metrics==3.2.0 (below RF4.0)

### Case 2: Using setup.py (clone project and run command within root)

python setup.py install

### Case 3: For latest changes use following command (pre-release or changes in master)

pip install git+https://github.com/adiralashiva8/robotframework-metrics

## Step 2 Execute robotmetrics command to generate report

### Case 1: No change in output.xml, log.html file name's and user is in same folder

robotmetrics

### Case 2: Change in output.xml, log.html file name's And .xml and .html files are under 'Result' folder

Para generar reporte de robotmetrics y poner logo
robotmetrics --logo "https://user-images.githubusercontent.com/55904664/138950175-cec1122b-d383-4398-a27f-3bfad0ecb199.png"


robotmetrics --inputpath ./Results/ --output output1.xml --log log1.html

robotframework-metrics can parse multiple xmls at a time. Following is the command

robotmetrics --inputpath ./Results/ --output "output1.xml,output2.xml" --log log1.html

For more info on command line options use:

robotmetrics --help

## Step 3 RobotFramework Metrics Report metric-timestamp.html file will be created in current folder | 

-inputpath if specified

Note: From v3.1.6 users can specify custom_report_name instead of metrics-timestamp.html

robotmetrics -M regression_metrics.html