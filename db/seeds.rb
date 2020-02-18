Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

# Create user method
@users = [
  {
    email: 'user@user.com',
    role:  'user'
  }, {
    email: 'admin@admin.com',
    role:  'admin'
  }, {
    email: 'content@content.com',
    role:  'content'
  }, {
    email: 'banned@user.com',
    role:  'user',
    banned: true
  }
]

def create_users(user)
  password = 'testtest'
  # banned = user[:banned] ? user[:banned] :false

  User.create(
    email:                 user[:email],
    role:                  user[:role],
    password:              password,
    password_confirmation: password
  )
end

@users.each do |user|
  u = create_users(user)
  puts "User with #{u.email} created"
end


# Route info methods
# Create seasons
@seasons = [
  {
    title: 'лето'
  }, {
    title: 'осень'
  }, {
    title: 'зима'
  }, {
    title: 'весна'
  }
]

@seasons.each do |season|
  s = Season.new(
    title: season[:title]
  )

  if s.save
    puts "Season #{s.title} created"
  else
    puts "Season #{s.title} not created"
  end
end

# Create difficulty
@difficulties = [
  {
    level: 'лёгкая'
  }, {
    level: 'средняя'
  }, {
    level: 'сложная'
  }
]

@difficulties.each do |difficulty|
  d = Difficulty.new(
    level: difficulty[:level]
  )

  if d.save
    puts "Difficulty #{d.level} created"
  else
    puts "Difficulty #{d.level} not created"
  end
end

# Create route kind
@kinds = [
  {
    title: 'пеший'
  }, {
    title: 'вело'
  }
]

@kinds.each do |kind|
  k = Kind.create(
    title: kind[:title]
  )

  if k.save
    puts "Kind #{k.title} created"
  else
    puts "Kind #{k.title} not created"
  end
end


# Create collection method
@collections = [
  {
    title:       'походы МО',
    description: 'походы по Московской Области'
  }, {
    title:       'походы выходного дня',
    description: 'походы на выходных'
  }
]

@collections.each do |collection|
  c = Collection.create(
    title:       collection[:title],
    description: collection[:description]
  )

  if c.save
    puts "Collection #{c.title} created"
  else
    puts "Collection #{c.title} not created"
  end
end

# Fake route covers
def upload_fake_route_cover
  uploader = CoverUploader.new(Route.new, :cover)
  # uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/genre/covers', '*')).sample))
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/assets/route/covers', '*')).sample))
  uploader
end


# Create route method
@routes = [
  {
    user_id:       User.all.sample.id,
    title:        'Oкская тропа',
    description:  'Маршрут вдоль реки Оки, в прошлом главного судоходного тракта через старинные города и села, от Павлова до города Горбатов. Это первый этап будущего большого маршрута от Павлова до Нижнего Новгорода общей протяженностью в 130 км.',
    distance:      '41 км',
    difficulty_id: Difficulty.all.sample.id,
    season_id:     Season.all.sample.id,
    kind_id:       Kind.all.sample.id,
    collection_id: Collection.all.sample.id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       User.all.sample.id,
    title:        'Озёрный край',
    description:  'Радиальный маршрут от озера Западное до озера Кщара. Включает в себя посещение четырех озер этого края. Может также быть совмещен с маршрутом "На озеро Кщара" с завершением в городе Вязники.',
    distance:      '39 км',
    difficulty_id: Difficulty.all.sample.id,
    season_id:     Season.all.sample.id,
    kind_id:       Kind.all.sample.id,
    collection_id: Collection.all.sample.id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       User.all.sample.id,
    title:        'Боровский тракт',
    description:  'Маршрут соединяет центры ремесел и старинные усадьбы в окрестностях Богородска и Ворсмы с районом карстовых озер и сосновых лесов в долине реки Сережа.',
    distance:      '15,2 км',
    difficulty_id: Difficulty.all.sample.id,
    season_id:     Season.all.sample.id,
    kind_id:       Kind.all.sample.id,
    collection_id: Collection.all.sample.id,
    cover:         upload_fake_route_cover
  }
  # {
  #   user_id:       User.all.sample.id,
  #   title:        'Тропы Березополья',
  #   description:  'Пешеходный маршрут по участку бывшего Боровского тракта и его окрестностям. Вы увидите, что осталось от старинной большой дороги, посетите Чайниково болото и красивое урочище Кузьминка.',
  #   distance:      '27 км',
  #   difficulty_id: Difficulty.all.sample.id,
  #   season_id:     Season.all.sample.id,
  #   kind_id:       Kind.all.sample.id,
  #   collection_id: Collection.all.sample.id
  # }, {
  #   user_id:       User.all.sample.id,
  #   title:        'Старицкая Земля',
  #   description:  'Уникальная архитектура, история и природа на всем протяжении маршрута в районе города Старица: пещеры, водопад, усадебные и купеческие постройки 16-17 века, церкви и монастырь.',
  #   distance:      '17,8 км',
  #   difficulty_id: Difficulty.all.sample.id,
  #   season_id:     Season.all.sample.id,
  #   kind_id:       Kind.all.sample.id,
  #   collection_id: Collection.all.sample.id
  # }
]

def create_route(route)
  Route.create(
    user_id:       route[:user_id],
    title:         route[:title],
    description:   route[:description],
    distance:      route[:distance],
    difficulty_id: route[:difficulty_id],
    season_id:     route[:season_id],
    kind_id:       route[:kind_id],
    collection_id: route[:collection_id],
    cover:         route[:cover]
  )
end

@routes.each do |route|
  route = create_route(route)

  if route.save
    puts "Route #{route.title} created"
  else
    puts "Route #{route.title} not created"
  end
end

def random_route_id
  Route.offset(rand(Route.count)).first.id
  # routes_quantity = Route.count
  # routes_random_offset = rand(routes_quantity)
  # random_route = Route.offset(routes_random_offset).first
  # random_route_id = random_route.id
  # random_route.id
end


# Create spot method
@spots = [
  {
    name:        'Абабковский монастырь',
    description: 'Не доходя до монастыря можно найти небольшую часовню с родником. Абабковский православный женский монастырь Выксунской епархии Русской православной церкви. В настоящее время монастырь восстанавливается к первоначальному образу, но уже сейчас можно увидеть внешний облик красивого храма.',
    tag_list:    ['храм', 'здание'],
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    user_id:      User.all.sample.id,
    longitude:    56.07072,
    latitude:     43.10256
  }, {
    name:        'река Кишма',
    description: 'Здесь туристам предстоит переход через реку по трубам. Ширина Кишмы здесь не более 15 метров и глубина от 1 до 1,5 метров.',
    tag_list:    'река',
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    user_id:      User.all.sample.id,
    longitude:    56.09047,
    latitude:     43.05308
  }, {
    name:        'урочище Костино',
    description: 'Отсюда открываются потрясающие виды на пойму Оки и бескрайний лес за рекой. А на месте поселения Костино, первое упоминание о котором датируется 15-ым веком, стоит крест и лежат каменные глыбы.',
    tag_list:    ['заброшка', 'река', 'храм'],
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    user_id:      User.all.sample.id,
    longitude:    56.13747,
    latitude:     43.01523
  }, {
    name:        'река Ока',
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:    ['река', 'здание'],
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    user_id:      User.all.sample.id,
    longitude:    56.10654,
    latitude:     43.03003
  }, {
    name:        'г. Павлово',
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:    ['река', 'здание'],
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    user_id:      User.all.sample.id,
    longitude:    55.964629,
    latitude:     43.064570
  }, {
    name:        'г. Горбатов',
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:    ['река', 'здание'],
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    user_id:      User.all.sample.id,
    longitude:    56.130869,
    latitude:     43.062701
  }
]

@spots.each do |spot|
  s = Spot.create(
    name:        spot[:name],
    description: spot[:description],
    tag_list:    spot[:tag_list],
    route_id:    spot[:route_id],
    user_id:     spot[:user_id],
    longitude:   spot[:longitude],
    latitude:    spot[:latitude]
  )

  if s.save
    puts "Spot #{s.name} created"
  else
    puts "Spot #{s.name} not created"
  end
end
