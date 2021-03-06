# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  if District.all.empty?
    District.create!(:name=>'思明区')
    District.create!(:name=>'湖里区')
    District.create!(:name=>'海沧区')
    District.create!(:name=>'集美区')
    District.create!(:name=>'同安区')
    District.create!(:name=>'翔安区')
  end
  Follow.all.each do |follow|
    follow.name=User.find(follow.user_id).email
    if follow.last_follow_date.blank?
      follow.last_follow_date=follow.created_at
    end
    follow.save!
  end
  Guest.where("status=?","checkin").each do |g|
    Renter.create(:name=>"#{g.name}",:budget=>"#{g.budget}",:guest_id=>"#{g.id}")
  end
