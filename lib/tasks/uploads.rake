namespace :uploads do

  desc 'Removes user uploaded files in the application'
  task clean: :environment do
    FileUtils.rm_rf('public/uploads/')
    puts 'Uploaded files have been removed.'
  end

end
