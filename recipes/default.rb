pg_user "securetruhearing" do
  privileges :superuser => true, :createdb => true, :login => true
  password "tXTV2aYqmdc7"
end

pg_database "securetruhearing_sprint5" do
  owner "securetruhearing"
  encoding "utf8"
  template "template0"
  locale "en_US.UTF8"
end

pg_database_extensions "securetruhearing_sprint5" do
  languages ["plpgsql", "plv8"]             # install `plpgsql` language - single value may be passed without array
  # extensions ["hstore"]  # install `hstore` and `dblink` extensions - multiple values in array
  # postgis true                     # install `postgis` support
end

# using apt install some packages
package "php5-pgsql" do
  action :install
end

package "postgresql-client-common" do
  action :install
end

package "postgresql-plpython-9.1" do
  action :install
end

package "smbfs" do
  action :install
end

package "php5-cli" do
  action :install
end

package "php5-curl" do
  action :install
end

package "php5-intl" do
  action :install
end

package "php5-mcrypt" do
  action :install
end

package "python-cjson" do
  action :install
end

include_recipe "apache2"

web_app "t3" do
  server_name "t3.dev"
  server_aliases ["www.t3.dev"]
  docroot "/var/www/t3/src/t3/"
end

