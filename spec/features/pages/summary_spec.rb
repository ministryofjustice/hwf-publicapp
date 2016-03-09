# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "summary" page for "Help with fees"' do
    context 'after answering yes to the dependents question' do
      before do
        visit '/dependent'
        choose 'dependent_children_true'
        fill_in :dependent_children_number, with: '10'
        click_button 'Continue'
        page.visit '/summary'
      end

      scenario 'I expect to see my answer' do
        expect(page).to have_content 'Children10'
      end
    end

    context 'after answering no to the dependents question' do
      before do
        visit '/dependent'
        choose 'dependent_children_false'
        click_button 'Continue'
        page.visit '/summary'
      end

      scenario 'I expect to a negative answer' do
        expect(page).to have_content 'ChildrenNo'
      end
    end

    context 'after answering yes to the probate question' do
      before do
        visit '/probate'
        choose 'probate_kase_true'
        fill_in :probate_deceased_name, with: 'Foo'
        fill_in :probate_date_of_death, with: Time.zone.today - 1.month
        click_button 'Continue'
        page.visit '/summary'
      end

      scenario 'I expect to see my answers' do
        expect(page).to have_content 'Name of deceasedFoo'
        expect(page).to have_content "Date of death#{(Time.zone.today - 1.month).strftime(Date::DATE_FORMATS[:default])}"
      end
    end

    context 'after answering no to the probate question' do
      before do
        visit '/probate'
        choose 'probate_kase_false'
        click_button 'Continue'
        page.visit '/summary'
      end

      scenario 'I do not expect to see the probate sub headers' do
        expect(page).not_to have_content 'Name of deceased'
        expect(page).not_to have_content 'Date of death'
      end
    end

    context 'after answering yes to all of the contact options' do
      before do
        visit '/contact'
        check :contact_email_option
        fill_in :contact_email, with: 'foo@bar.com'
        check :contact_phone_option
        fill_in :contact_phone, with: '00000 000000'
        check :contact_post_option
        click_button 'Continue'
      end

      scenario 'I expect confirmation ' do
        expect(page).to have_content 'Emailfoo@bar.com'
        expect(page).to have_content 'Phone00000 000000'
        expect(page).to have_content 'PostYes'
      end
    end

    context 'after answering no to all of the contact options' do
      before do
        visit '/contact'
        click_button 'Continue'
      end

      scenario 'I expect confirmation ' do
        expect(page).to have_content 'ContactContact details not provided'
      end
    end

    scenario 'the change links take me to the correct page' do
      visit '/summary'
      expect(page).to have_xpath "//a[.='Change'][@href='/marital-status']"
      expect(page).to have_xpath "//a[.='Change'][@href='/savings-and-investment']"
      expect(page).to have_xpath "//a[.='Change'][@href='/benefit']"
      expect(page).to have_xpath "//a[.='Change'][@href='/dependent']"
      expect(page).to have_xpath "//a[.='Change'][@href='/income']"
      expect(page).to have_xpath "//a[.='Change'][@href='/fee']"
      expect(page).to have_xpath "//a[.='Change'][@href='/probate']"
      expect(page).to have_xpath "//a[.='Change'][@href='/claim']"
      expect(page).to have_xpath "//a[.='Change'][@href='/form-name']"
      expect(page).to have_xpath "//a[.='Change'][@href='/dob']"
      expect(page).to have_xpath "//a[.='Change'][@href='/national-insurance']"
      expect(page).to have_xpath "//a[.='Change'][@href='/personal-detail']"
      expect(page).to have_xpath "//a[.='Change'][@href='/applicant-address']"
      expect(page).to have_xpath "//a[.='Change'][@href='/contact']"
    end
  end
end
