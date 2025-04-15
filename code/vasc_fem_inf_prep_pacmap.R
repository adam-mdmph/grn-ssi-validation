# Create project specific python environment
conda_create(my_env)

# Go into global options and select the new python environment, which will restart R

# Confirm that project specific environment is created
conda_list()

# Select project specific environment and install relevant packages
use_condaenv(my_env)

py_install("pandas",envname = my_env)
py_install("numpy",envname = my_env)
py_install("seaborn",envname = my_env)
py_install("scikit-learn",envname = my_env)
py_install("matplotlib",envname = my_env)
py_install("pacmap",envname = my_env)
py_install("dbscan",envname = my_env)

#py_install("fasterrisk", envname = my_env) - installed with command line 'python -m pip install --cert C:\dhcert.pem fasterrisk'
