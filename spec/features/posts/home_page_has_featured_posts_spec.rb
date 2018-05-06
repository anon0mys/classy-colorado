require 'rails_helper'

feature 'Featured Posts' do
  before(:each) do
    @posts = create_list(:post, 5)
    @featured = create_list(:post, 2, status: 'featured')
  end

  context 'all users' do
    scenario 'can see a list of featured posts on the home page' do
      visit root_path

      expect(page).to have_content(@featured.first.title)
      expect(page).to have_content(@featured.last.title)
      @posts.each do |post|
        expect(page).to_not have_content(post.title)
      end
    end

    scenario 'featured posts link to post show pages' do
      visit root_path

      post = @featured.first

      click_on post.title

      expect(current_path).to eq(post_path(post))
    end
  end

  context 'an Admin' do
    scenario 'can set a featured flag on a post' do
    end
  end
end
