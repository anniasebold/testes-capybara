describe "Upload", :upload do
  
  before(:each) do
    visit "http://staging.arqnex.jera.com.br/"
    @arquivo = Dir.pwd + '/images/exemplo.jpeg'
    @arquivo2 = Dir.pwd + '/images/exemplo2.jpeg'
  end

  it "upload-project" do
    click_link "Entrar agora"

    fill_in "loginEmail", with: "annia@jera.com.br"
    fill_in "loginPassword", with: "secret123"

    click_button "submitLogin"
    expect(page).to have_content("Olá Annia Sebold")

    click_link "Postar trabalho"
    expect(page).to have_content("Qual seu último trabalho?")

    attach_file('projectImagesInput', @arquivo, visible: :false)

    fill_in "project_name", with: "#{Faker::Movie.title}"
    software_name = "SketchUp"
    fill_in "projectSoftwaresChip", with: "#{software_name}"
    find('.ui-menu-item', text: "#{software_name}", match: :first).click

    fill_in "project_description", with: "#{Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)}"
    click_button "publishProject"

    expect(page).to have_content("Projeto aprovado") 
    click_button "continueModalButton"

    expect(page).to have_content("Annia") 
  end

  after(:each) do
    sleep 5
  end
end