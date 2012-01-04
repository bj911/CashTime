  namespace :data do
    task :picture => :environment do
      categories = Dir[Rails.root.to_s+'/app/assets/images/*'].map{ |f| File.basename(f) }
      categories.each do |category|
        names = Dir[Rails.root.to_s+"/app/assets/images/#{category}/**/*.jpg"].map{ |f| File.basename(f) }
        names.each do |name|
          puts name
          Picture.create(:name => name, :logo => File.open(Rails.root.to_s+"/app/assets/images/#{category}/#{name}"), :category => category, :like => false, :count_like => 0)
        end
      end
    end
  end