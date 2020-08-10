namespace :delete do
  desc 'Delete appointments where date has already passed'
  task :old_records => :environment do
    Booking.where('created_at < ?',Date.current).each do |booking|
      booking.destroy
    end
  end
end