require 'rails_helper'

feature 'Post CRUD' do
  context 'all users' do
    before(:each) do
      DatabaseCleaner.clean
      @posts = create_list(:post, 30)
    end

    after(:each) do
      FactoryBot.reload
      DatabaseCleaner.clean
    end

    scenario 'can see all posts on index' do
      visit posts_path

      expect(page).to have_content(@posts.first.title)
      expect(page).to have_content(@posts.first.author.email)

      expect(page).to have_content(@posts[14].title)
      expect(page).to have_content(@posts.last.title)
    end

    scenario 'can see a post show page' do
      visit posts_path

      click_on @posts.first.title

      expect(current_path).to eq(post_path(@posts.first))
      expect(page).to have_content(@posts.first.title)
      expect(page).to have_content(@posts.first.author.email)
      expect(page).to have_content(@posts.first.body)
    end
  end

  context 'an Admin' do
    before(:each) do
      DatabaseCleaner.clean
      admin = create(:admin)
      sign_in admin
    end

    after(:each) do
      FactoryBot.reload
      DatabaseCleaner.clean
    end

    scenario 'can create a post' do
      visit new_admin_post_path

      fill_in 'post_title', with: 'Title'
      fill_in 'post_body', with: 'Body'
      click_on  'Create'

      post = Post.first

      expect(current_path).to eq(post_path(post))
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.body)
    end

    scenario 'can edit a post' do
      post = create(:post)

      visit post_path(post)

      expect(page).to have_content('Post 1')
      expect(page).to have_content('Body')

      click_on 'Edit'

      expect(current_path).to eq(edit_admin_post_path(post))

      fill_in 'post_title', with: 'Test Title'
      fill_in 'post_body', with: 'Test Body'
      click_on  'Update'

      expect(current_path).to eq(post_path(post))
      expect(page).to have_content('Test Title')
      expect(page).to have_content('Test Body')
    end

    scenario 'can delete a post' do
      posts = create_list(:post, 9)

      visit posts_path

      expect(page).to have_content(posts.first.title)

      click_on posts.first.title

      click_on 'Delete'

      expect(current_path).to eq(posts_path)
      expect(page).to_not have_content(posts.first.title)
    end
  end
end
