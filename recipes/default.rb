#
# Cookbook Name:: locale-uk
# Recipe:: default
#
# Copyright 2013, Ian Kenney
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Taken from https://github.com/rchampourlier/vagrant-stacks/blob/master/cookbooks/set_locale/recipes/default.rb
# many thanks
# We assume the setup is correct if the expected environment variables are set to
# en_US.UTF-8

unless  ENV["LANGUAGE"] == "en_GB.UTF-8" &&
        ENV["LANG"] == "en_GB.UTF-8" &&
        ENV["LC_ALL"] == "en_GB.UTF-8"

  template "/etc/profile.d/lang.sh" do
    source  "lang.sh.erb"
    mode "0644"
  end

  execute "locale-gen" do
    command "locale-gen en_GB.UTF-8"
  end

  execute "dpkg-reconfigure-locales" do
    command "dpkg-reconfigure locales"
  end
end
