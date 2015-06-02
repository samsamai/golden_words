require "test_helper"

feature "Goldenwords" do
  scenario "the test is sound" do
    visit new_goldenword_path
   page.must_have_link('Add')
  end
end
