# frozen_string_literal: true

office = Office.create(name: '本店')
office.users.create(name: 'akito hikasa', email: 'admin@example.com', password: 'password')

sub_office = Office.create(name: '支店')
sub_office.users.create(name: 'taro yamada', email: 'taro@yamada.com', password: 'password')

machine_specs = [
  {
    name: 'CAT'
  },
  {
    name: 'KOMATSU'
  },
  {
    name: 'Deere'
  },
  {
    name: 'HITACHI'
  },
  {
    name: 'VOLVO'
  }
]

[office, sub_office].each do |target_office|
  machine_specs.each { |spec| target_office.machines.create(name: "#{target_office.name}_#{spec[:name]}") }
end
