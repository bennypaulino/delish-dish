FactoryGirl.define do
  factory :post do
    title "Photo skills"
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/padthai.jpg', 'image/jpg')
  end
end
