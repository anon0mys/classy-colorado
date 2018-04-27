require 'rails_helper'

feature 'Admin' do
  context 'from the posts path' do
    before(:each) do
      DatabaseCleaner.clean
      create_list(:post, 30)
    end

    after(:each) do
      DatabaseCleaner.clean
    end

    scenario 'can see all posts on index' do
      admin = create(:admin)
      sign_in admin

      visit posts_path

      expect(page).to have_content(@posts.first.title)
      expect(page).to have_content(@posts.first.author)

      expect(page).to have_content(@posts[14].title)
      expect(page).to have_content(@posts.last.title)
    end

    scenario 'can see a post show page' do

    end
  end

  context 'from the admin namespaced posts path' do
    scenario 'can create a post' do

    end

    scenario 'can edit a post' do

    end

    scenario 'can delete a post' do

    end
  end
end
