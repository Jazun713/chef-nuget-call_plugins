# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

log "Executing plugins, #{node['wjv-docker01']}!" do
  level :info
end

http_request 'POST archive master repo' do
  action :post
  url 'http://localhost:8081/artifactory/api/plugins/execute/archive_old_artifacts?params=srcRepo=nuget-master|archiveRepo=nuget-archive|lastModifiedDays=180|includePropertySet=analysis.deprecated:true|numKeepArtifacts=5'
  message ''
  headers({'AUTHORIZATION' => "Basic #{Base64.encode64('username:password')}",
           'Content-Type' => 'text/plain'
  })
end

# For more information, see the documentation: https://docs.chef.io/essentials_cookbook_recipes.html
