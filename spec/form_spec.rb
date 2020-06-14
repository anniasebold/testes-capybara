describe "Register", :register do
  it "register-correct" do
    visit 'http://staging.arqnex.jera.com.br/'
    click_link 'Cadastrar'

    random_name = Faker::Name.name
    fill_in 'name', with: "#{random_name}"

    atuation = ["Arquiteto", "Acadêmico de Design", "Acadêmico de Arquitetura", "Designer"]
    random_atuation = atuation.sample
    select("#{random_atuation}", from: 'scholarship')

    if(random_atuation == "Arquiteto") 
      fill_in 'registerCau', with: "#{Faker::Number.number(digits: 5)}"
    end

    random_cpf = CpfUtils.cpf
    valid_cpf = CpfUtils.valid_cpf?("#{random_cpf}")

    if valid_cpf == true 
      fill_in 'cpf', with: "#{random_cpf}"
    else
      fill_in 'cpf', with: "#{DocumentosBr.cpf}"
    end

    city_exists = false

    while !city_exists do
      random_city = Faker::Address.city
      fill_in 'findCity', with: "#{random_city}"
      city_exists = page.has_css?('.ui-menu-item', text: "#{random_city}", exact_text: false, wait: 10)
    end
    find('.ui-menu-item', text: "#{random_city}", match: :first).click

    fill_in 'email', with: "#{Faker::Internet.email}"
    fill_in 'password', with: 'secret123'

    find('.custom-control-label', text: 'Ao criar minha conta eu aceito os').click

    click_button 'register'
    click_button 'continue'
    expect(page).to have_content("Olá #{random_name}") 
    sleep 5
  end

  it "no-city" do
    visit 'http://staging.arqnex.jera.com.br/'
    click_link 'Cadastrar'

    random_name = Faker::Name.name
    fill_in 'name', with: "#{random_name}"

    atuation = ["Arquiteto", "Acadêmico de Design", "Acadêmico de Arquitetura", "Designer"]
    random_atuation = atuation.sample
    select("#{random_atuation}", from: 'scholarship')

    if(random_atuation == "Arquiteto") 
      fill_in 'registerCau', with: "#{Faker::Number.number(digits: 5)}"
    end

    random_cpf = CpfUtils.cpf
    valid_cpf = CpfUtils.valid_cpf?("#{random_cpf}")

    if valid_cpf == true 
      fill_in 'cpf', with: "#{random_cpf}"
    else
      fill_in 'cpf', with: "#{DocumentosBr.cpf}"
    end

    # city_exists = false

    # while !city_exists do
    #   random_city = Faker::Address.city
    #   fill_in 'findCity', with: "#{random_city}"
    #   city_exists = page.has_css?('.ui-menu-item', text: "#{random_city}", wait: 10)
    # end

    fill_in 'email', with: "#{Faker::Internet.email}"
    fill_in 'password', with: 'secret123'

    find('.custom-control-label', text: 'Ao criar minha conta eu aceito os').click

    click_button 'register'
    expect(page).to have_content("Cidade não pode ficar em branco") 
    sleep 5
  end

  it "no-email" do
    visit 'http://staging.arqnex.jera.com.br/'
    click_link 'Cadastrar'

    random_name = Faker::Name.name
    fill_in 'name', with: "#{random_name}"

    atuation = ["Arquiteto", "Acadêmico de Design", "Acadêmico de Arquitetura", "Designer"]
    random_atuation = atuation.sample
    select("#{random_atuation}", from: 'scholarship')

    if(random_atuation == "Arquiteto") 
      fill_in 'registerCau', with: "#{Faker::Number.number(digits: 5)}"
    end

    random_cpf = CpfUtils.cpf
    valid_cpf = CpfUtils.valid_cpf?("#{random_cpf}")

    if valid_cpf == true 
      fill_in 'cpf', with: "#{random_cpf}"
    else
      fill_in 'cpf', with: "#{DocumentosBr.cpf}"
    end

    city_exists = false

    while !city_exists do
      random_city = Faker::Address.city
      fill_in 'findCity', with: "#{random_city}"
      city_exists = page.has_css?('.ui-menu-item', text: "#{random_city}", wait: 10)
    end
    find('.ui-menu-item', text: "#{random_city}", match: :first).click

    # fill_in 'email', with: "#{Faker::Internet.email}"
    fill_in 'password', with: 'secret123'

    find('.custom-control-label', text: 'Ao criar minha conta eu aceito os').click

    click_button 'register'
    expect(page).to have_content("Email não pode ficar em branco") 
    sleep 5
  end

  it "no-cpf" do
    visit 'http://staging.arqnex.jera.com.br/'
    click_link 'Cadastrar'

    random_name = Faker::Name.name
    fill_in 'name', with: "#{random_name}"

    atuation = ["Arquiteto", "Acadêmico de Design", "Acadêmico de Arquitetura", "Designer"]
    random_atuation = atuation.sample
    select("#{random_atuation}", from: 'scholarship')

    if(random_atuation == "Arquiteto") 
      fill_in 'registerCau', with: "#{Faker::Number.number(digits: 5)}"
    end

    # random_cpf = CpfUtils.cpf
    # valid_cpf = CpfUtils.valid_cpf?("#{random_cpf}")

    # if valid_cpf == true 
    #   fill_in 'cpf', with: "#{random_cpf}"
    # else
    #   fill_in 'cpf', with: "#{DocumentosBr.cpf}"
    # end

    city_exists = false

    while !city_exists do
      random_city = Faker::Address.city
      fill_in 'findCity', with: "#{random_city}"
      city_exists = page.has_css?('.ui-menu-item', text: "#{random_city}", wait: 10)
    end
    find('.ui-menu-item', text: "#{random_city}", match: :first).click

    fill_in 'email', with: "#{Faker::Internet.email}"
    fill_in 'password', with: 'secret123'

    find('.custom-control-label', text: 'Ao criar minha conta eu aceito os').click

    click_button 'register'
    expect(page).to have_content("Documento Inválido") 
    sleep 5
  end

  it "no-name" do
    visit 'http://staging.arqnex.jera.com.br/'
    click_link 'Cadastrar'

    # random_name = Faker::Name.name
    # fill_in 'name', with: "#{random_name}"

    atuation = ["Arquiteto", "Acadêmico de Design", "Acadêmico de Arquitetura", "Designer"]
    random_atuation = atuation.sample
    select("#{random_atuation}", from: 'scholarship')

    if(random_atuation == "Arquiteto") 
      fill_in 'registerCau', with: "#{Faker::Number.number(digits: 5)}"
    end

    random_cpf = CpfUtils.cpf
    valid_cpf = CpfUtils.valid_cpf?("#{random_cpf}")

    if valid_cpf == true 
      fill_in 'cpf', with: "#{random_cpf}"
    else
      fill_in 'cpf', with: "#{DocumentosBr.cpf}"
    end

    city_exists = false

    while !city_exists do
      random_city = Faker::Address.city
      fill_in 'findCity', with: "#{random_city}"
      city_exists = page.has_css?('.ui-menu-item', text: "#{random_city}", wait: 10)
    end
    find('.ui-menu-item', text: "#{random_city}", match: :first).click

    fill_in 'email', with: "#{Faker::Internet.email}"
    fill_in 'password', with: 'secret123'

    find('.custom-control-label', text: 'Ao criar minha conta eu aceito os').click

    click_button 'register'
    expect(page).to have_content("Nome não pode ficar em branco") 
    sleep 5
  end

  it "invalid-cpf" do
    visit 'http://staging.arqnex.jera.com.br/'
    click_link 'Cadastrar'

    random_name = Faker::Name.name
    fill_in 'name', with: "#{random_name}"

    atuation = ["Arquiteto", "Acadêmico de Design", "Acadêmico de Arquitetura", "Designer"]
    random_atuation = atuation.sample
    select("#{random_atuation}", from: 'scholarship')

    if(random_atuation == "Arquiteto") 
      fill_in 'registerCau', with: "#{Faker::Number.number(digits: 5)}"
    end

    fill_in 'cpf', with: "1111111111"

    city_exists = false

    while !city_exists do
      random_city = Faker::Address.city
      fill_in 'findCity', with: "#{random_city}"
      city_exists = page.has_css?('.ui-menu-item', text: "#{random_city}", wait: 10)
    end
    find('.ui-menu-item', text: "#{random_city}", match: :first).click

    fill_in 'email', with: "#{Faker::Internet.email}"
    fill_in 'password', with: 'secret123'

    find('.custom-control-label', text: 'Ao criar minha conta eu aceito os').click

    click_button 'register'
    expect(page).to have_content("Documento Inválido") 
    sleep 5
  end

  it "invalid-email" do
    visit 'http://staging.arqnex.jera.com.br/'
    click_link 'Cadastrar'

    random_name = Faker::Name.name
    fill_in 'name', with: "#{random_name}"

    atuation = ["Arquiteto", "Acadêmico de Design", "Acadêmico de Arquitetura", "Designer"]
    random_atuation = atuation.sample
    select("#{random_atuation}", from: 'scholarship')

    if(random_atuation == "Arquiteto") 
      fill_in 'registerCau', with: "#{Faker::Number.number(digits: 5)}"
    end

    random_cpf = CpfUtils.cpf
    valid_cpf = CpfUtils.valid_cpf?("#{random_cpf}")

    if valid_cpf == true 
      fill_in 'cpf', with: "#{random_cpf}"
    else
      fill_in 'cpf', with: "#{DocumentosBr.cpf}"
    end

    city_exists = false
    while !city_exists do
      random_city = Faker::Address.city
      fill_in 'findCity', with: "#{random_city}"
      city_exists = page.has_css?('.ui-menu-item', text: "#{random_city}", wait: 10)
    end
    find('.ui-menu-item', text: "#{random_city}", match: :first).click

    fill_in 'email', with: 'annia'
    fill_in 'password', with: 'secret123'

    find('.custom-control-label', text: 'Ao criar minha conta eu aceito os').click

    click_button 'register'
    expect(page).to have_content("Email Inválido") 
    sleep 5
  end

   it "invalid-password" do
    visit 'http://staging.arqnex.jera.com.br/'
    click_link 'Cadastrar'

    random_name = Faker::Name.name
    fill_in 'name', with: "#{random_name}"

    atuation = ["Arquiteto", "Acadêmico de Design", "Acadêmico de Arquitetura", "Designer"]
    random_atuation = atuation.sample
    select("#{random_atuation}", from: 'scholarship')

    if(random_atuation == "Arquiteto") 
      fill_in 'registerCau', with: "#{Faker::Number.number(digits: 5)}"
    end

    random_cpf = CpfUtils.cpf
    valid_cpf = CpfUtils.valid_cpf?("#{random_cpf}")

    if valid_cpf == true 
      fill_in 'cpf', with: "#{random_cpf}"
    else
      fill_in 'cpf', with: "#{DocumentosBr.cpf}"
    end

    city_exists = false
    while !city_exists do
      random_city = Faker::Address.city
      fill_in 'findCity', with: "#{random_city}"
      city_exists = page.has_css?('.ui-menu-item', text: "#{random_city}", wait: 10)
    end
    find('.ui-menu-item', text: "#{random_city}", match: :first).click

    fill_in 'email', with: "#{Faker::Internet.email}"
    fill_in 'password', with: '12345'

    find('.custom-control-label', text: 'Ao criar minha conta eu aceito os').click

    click_button 'register'
    expect(page).to have_content("Senha muito pequena, minimo é 6") 
    sleep 5
  end

  it "invalid-password-and-email", :erro do
    visit 'http://staging.arqnex.jera.com.br/'
    click_link 'Cadastrar'

    random_name = Faker::Name.name
    fill_in 'name', with: "#{random_name}"

    atuation = ["Arquiteto", "Acadêmico de Design", "Acadêmico de Arquitetura", "Designer"]
    random_atuation = atuation.sample
    select("#{random_atuation}", from: 'scholarship')

    if(random_atuation == "Arquiteto") 
      fill_in 'registerCau', with: "#{Faker::Number.number(digits: 5)}"
    end

    random_cpf = CpfUtils.cpf
    valid_cpf = CpfUtils.valid_cpf?("#{random_cpf}")
    puts random_cpf

    if valid_cpf == true 
      fill_in 'cpf', with: "#{random_cpf}"
    else
      fill_in 'cpf', with: "#{DocumentosBr.cpf}"
    end

    city_exists = false
    while !city_exists do
      random_city = Faker::Address.city
      fill_in 'findCity', with: "#{random_city}"
      city_exists = page.has_css?('.ui-menu-item', text: "#{random_city}", wait: 10)
    end
    find('.ui-menu-item', text: "#{random_city}", match: :first).click

    fill_in 'email', with: 'annia'
    fill_in 'password', with: '12345'

    find('.custom-control-label', text: 'Ao criar minha conta eu aceito os').click

    click_button 'register'
    expect(page).to have_content("Email inválido") 
    sleep 5
  end

end