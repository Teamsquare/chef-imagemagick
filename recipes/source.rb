include_recipe "build-essential"
include_recipe 'apt'

package 'libmagickwand-dev'

remote_file "#{Chef::Config[:file_cache_path]}/ImageMagick-7.0.4-2.tar.gz" do
  source "https://www.imagemagick.org/download/ImageMagick-7.0.4-2.tar.gz"
end

bash 'untar_imagemagick' do
  cwd "#{Chef::Config[:file_cache_path]}"

  code <<-EOH
    tar -xzvf ImageMagick-7.0.4-2.tar.gz
  EOH
  not_if { ::File.directory?("#{Chef::Config['file_cache_path'] || '/tmp'}/ImageMagick-7.0.4-2") }
end

bash 'install-imagemagick' do
  cwd "#{Chef::Config[:file_cache_path]}/ImageMagick-7.0.4-2"

  code <<-EOH
    ./configure
    make
    make install
    ldconfig /usr/local/lib
  EOH

  # HELP! Add idempotence
  # not_if do
  # end
end

