# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name "demo"

# Where to find external cookbooks:
default_source :supermarket

include_policy 'cronner',
               git: 'https://github.com/rhass/cookbook-cronner',
               path: 'nested_test/Policyfile.lock.json'

include_policy 'jenkins',
#                git: 'https://github.com/danielsdeleo/policyfile-jenkins-demo'
                git: '/home/rhass/src/policyfile-jenkins-demo'

# run_list: chef-client will run these recipes in the order specified.
run_list "demo::default"

# Specify a custom source for a single cookbook:
cookbook "demo", path: "."

override["java"]["jdk_version"] = '8'
