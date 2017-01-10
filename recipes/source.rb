include_recipe "build-essential"
include_recipe 'apt'

package 'libmagickwand-dev'

remote_file "#{Chef::Config[:file_cache_path]}/ImageMagick.tar.gz" do
  source "https://www.imagemagick.org/download/ImageMagick.tar.gz"
end

bash 'untar_imagemagick' do
  cwd "#{Chef::Config[:file_cache_path]}"

  code <<-EOH
    mkdir ImageMagick && tar -xzvf ImageMagick.tar.gz -C ImageMagick --strip-components=1
  EOH
  not_if { ::File.directory?("#{Chef::Config['file_cache_path'] || '/tmp'}/ImageMagick") }
end

bash 'install-imagemagick' do
  cwd "#{Chef::Config[:file_cache_path]}/ImageMagick"

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

