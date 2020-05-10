Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

# Create user
@users = [
  {
    email: 'admin@admin.com',
    nickname: 'true admin',
    role:  0
  }, {
    email: 'content@content.com',
    nickname: 'makes content here',
    role:  1
  }, {
    email: 'user@user.com',
    nickname: 'user 1',
    role:  2
  }, {
    email: 'user2@user.com',
    nickname: 'user 2',
    role:  2
  }, {
    email: 'user3@user.com',
    nickname: 'user 3',
    role:  2
  }
]

def create_users(user)
  password = 'testtest'

  User.create(
    email:                 user[:email],
    nickname:              user[:nickname],
    role:                  user[:role],
    password:              password,
    password_confirmation: password
  )
end

@users.each do |user|
  u = create_users(user)
  puts "User with #{u.email} created"
end


# Route info
@seasons = [ 'лето', 'осень', 'зима', 'весна' ]
@difficulties = [ 'лёгкая', 'средняя', 'сложная' ]
@kinds = [ 'пеший', 'вело' ]

def random_season
  rand(0..3)
end

def random_difficulty
  rand(0..2)
end

def random_kind
  rand(0..1)
end

def random_distance
  rand(14000..60000)
end

# Create route_info method
@takeaways = [ 'Еда и питье', 'Подходящая одежда и обувь', 'Личное и групповое снаряжение', 'Аптечка' ]

@warnings = [
  'Затопление участков (весна)',
  'Нерасчищенные участки (зима)',
  'Крутые спуски и подъемы с натянутыми перилами',
  'Гадюки'
]


# Create collection
@collections = [
  {
    title:       'походы МО',
    description: 'походы по Московской Области',
    user_id:      2
  }, {
    title:       'походы выходного дня',
    description: 'походы на выходных',
    user_id:      2
  }
]

@collections.each do |collection|
  c = Collection.new(collection)

  if c.save
    puts "Collection #{c.title} created"
  else
    puts "Collection #{c.title} not created"
  end
end

def random_collection_id
  Collection.offset(rand(Collection.count)).first.id
end

# Fake route covers
def upload_fake_route_cover
  uploader = CoverUploader.new(Route.new, :cover)
  # uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/genre/covers', '*')).sample))
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/assets/route/covers', '*')).uniq.sample))
  uploader
end

track = "[[43.058748,56.132651],[43.05877,56.132544],[43.057139,56.132523],[43.057118,56.131621],[43.044179,56.131621],[43.043406,56.131793],[43.042076,56.131772],[43.04169,56.132115],[43.039351,56.132244],[43.038986,56.1319],[43.037269,56.131943],[43.032141,56.131922],[43.030446,56.131986],[43.029287,56.132158],[43.023236,56.134068],[43.022163,56.135162],[43.019116,56.13587],[43.018794,56.13617],[43.018129,56.136428],[43.017786,56.136986],[43.016112,56.137672],[43.014331,56.137694],[43.013258,56.137222],[43.012078,56.136878],[43.011906,56.136557],[43.013215,56.133703],[43.01373,56.132673],[43.013945,56.131836],[43.013966,56.1316],[43.01373,56.131192],[43.01328,56.130763],[43.013301,56.130291],[43.014224,56.129089],[43.017571,56.125635],[43.019567,56.122759],[43.020146,56.122566],[43.020511,56.122159],[43.020575,56.12188],[43.020661,56.121708],[43.021691,56.121472],[43.022356,56.121107],[43.022742,56.121214],[43.022936,56.122094],[43.024287,56.122867],[43.025124,56.122888],[43.025725,56.122008],[43.026347,56.121279],[43.027313,56.120356],[43.027678,56.119777],[43.027077,56.118575],[43.028386,56.118532],[43.028922,56.117803],[43.02918,56.117352],[43.028794,56.116816],[43.029051,56.116086],[43.029845,56.115485],[43.031733,56.114777],[43.032098,56.114284],[43.033021,56.113962],[43.035681,56.11409],[43.035166,56.113168],[43.031819,56.112095],[43.030961,56.110679],[43.029931,56.109305],[43.03036,56.108275],[43.029244,56.10776],[43.030489,56.107138],[43.029845,56.106366],[43.030102,56.105507],[43.030918,56.104477],[43.031347,56.103126],[43.03139,56.102224],[43.03478,56.099628],[43.043621,56.094993],[43.045101,56.094113],[43.044737,56.093212],[43.043878,56.092461],[43.053706,56.089951],[43.061795,56.088191],[43.064349,56.088363],[43.072031,56.092504],[43.076108,56.093727],[43.078468,56.094585],[43.077309,56.090745],[43.077738,56.08935],[43.080528,56.085187],[43.08188,56.083814],[43.083811,56.082076],[43.08939,56.079887],[43.097458,56.077763],[43.101363,56.078106],[43.108037,56.076303],[43.109367,56.074866],[43.106384,56.074952],[43.106342,56.074308],[43.105998,56.072806],[43.103724,56.071561],[43.103252,56.07139],[43.102501,56.071304],[43.10117,56.071347],[43.100977,56.071433],[43.10132,56.071561],[43.102093,56.071669],[43.102329,56.071883],[43.102243,56.072055],[43.101363,56.072377],[43.098917,56.072355],[43.097501,56.071754],[43.098488,56.070896],[43.101406,56.070059],[43.111577,56.067828],[43.114495,56.067849],[43.117843,56.067313],[43.120203,56.067635],[43.122821,56.067334],[43.126984,56.067098],[43.130675,56.067334],[43.134666,56.067205],[43.138871,56.067463],[43.140931,56.067699],[43.142047,56.068343],[43.142626,56.068192],[43.145888,56.068514],[43.147948,56.068386],[43.148999,56.068407],[43.148549,56.068064],[43.148592,56.067892],[43.14915,56.067763],[43.150952,56.066969],[43.151746,56.066519],[43.152304,56.066025],[43.152776,56.065682],[43.153141,56.065489],[43.155308,56.065703],[43.155801,56.065832],[43.157346,56.065253],[43.159042,56.065017],[43.159836,56.065317],[43.160501,56.066047],[43.163784,56.065317],[43.168097,56.063493],[43.171895,56.062077],[43.173247,56.061412],[43.173397,56.060618],[43.175135,56.058665],[43.175864,56.057571],[43.176186,56.056906],[43.17653,56.054846],[43.175929,56.054717],[43.175543,56.054395],[43.174298,56.05549],[43.172217,56.055768],[43.169513,56.054696],[43.167474,56.054481],[43.165758,56.053816],[43.16535,56.053344],[43.165801,56.05255],[43.166058,56.05152],[43.166638,56.05064],[43.167625,56.050147],[43.167196,56.049911],[43.166809,56.049567],[43.166874,56.049074],[43.16771,56.047958],[43.167818,56.047507],[43.166745,56.047185],[43.165479,56.046928],[43.163698,56.045598],[43.16211,56.043409],[43.160544,56.041435],[43.160243,56.041413],[43.159063,56.041692],[43.155544,56.0421],[43.154257,56.042186],[43.153913,56.041928],[43.15402,56.041714],[43.154106,56.041327],[43.151982,56.040941],[43.151853,56.040512],[43.151553,56.04034],[43.151338,56.040147],[43.150995,56.040104],[43.14651,56.040898],[43.143442,56.040791],[43.141489,56.041392],[43.13988,56.041499],[43.138571,56.041435],[43.138013,56.04077],[43.137477,56.04034],[43.137155,56.039933],[43.137391,56.039289],[43.137798,56.039074],[43.137305,56.038517],[43.137605,56.03828],[43.138807,56.038109],[43.139687,56.037894],[43.139944,56.036457],[43.140052,56.035298],[43.139279,56.034847],[43.136103,56.034547],[43.130953,56.034397],[43.12855,56.035512],[43.126233,56.03444],[43.123186,56.034397],[43.118208,56.031328],[43.116448,56.029118],[43.114946,56.02768],[43.114517,56.026178],[43.114603,56.025299],[43.115547,56.023904],[43.117628,56.021951],[43.11868,56.021243],[43.12001,56.020814],[43.120418,56.020835],[43.117778,56.021479],[43.115697,56.02341],[43.114689,56.024784],[43.113423,56.025256],[43.112328,56.02517],[43.109453,56.02444],[43.106234,56.023882],[43.104711,56.021629],[43.104539,56.021243],[43.104732,56.020685],[43.103252,56.016973],[43.102758,56.013282],[43.101664,56.003862],[43.097758,56.003648],[43.096342,56.00294],[43.096621,56.002253],[43.096643,55.999764],[43.095012,55.999635],[43.09454,55.996738],[43.096042,55.996824],[43.095784,55.99397],[43.096643,55.991267],[43.097394,55.991202],[43.095784,55.989851],[43.093918,55.98646],[43.091257,55.980323],[43.092652,55.979401],[43.090506,55.975667],[43.086493,55.976461],[43.082845,55.974959],[43.07982,55.976504],[43.078747,55.976032],[43.07791,55.975967],[43.07658,55.974852],[43.075507,55.974315],[43.074541,55.973135],[43.07379,55.972985],[43.07364,55.972663],[43.069992,55.970174],[43.06907,55.969938],[43.067846,55.968822],[43.066108,55.968264],[43.065829,55.967728],[43.064971,55.967449]]"

# Create route
@routes = [
  {
    user_id:       2,
    title:        'Oкская тропа',
    description:  'Маршрут вдоль реки Оки, в прошлом главного судоходного тракта через старинные города и села, от Павлова до города Горбатов. Это первый этап будущего большого маршрута от Павлова до Нижнего Новгорода общей протяженностью в 130 км.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover,
    track:         track
  }, {
    user_id:       2,
    title:        'Озёрный край',
    description:  'Радиальный маршрут от озера Западное до озера Кщара. Включает в себя посещение четырех озер этого края. Может также быть совмещен с маршрутом "На озеро Кщара" с завершением в городе Вязники.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover,
    track:         track
  }, {
    user_id:       2,
    title:        'Боровский тракт',
    description:  'Маршрут соединяет центры ремесел и старинные усадьбы в окрестностях Богородска и Ворсмы с районом карстовых озер и сосновых лесов в долине реки Сережа.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover,
    track:         track
  }, {
    user_id:       2,
    title:        'Тропы Березополья',
    description:  'Пешеходный маршрут по участку бывшего Боровского тракта и его окрестностям. Вы увидите, что осталось от старинной большой дороги, посетите Чайниково болото и красивое урочище Кузьминка.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover,
    track:         track
  }, {
    user_id:       2,
    title:        'Старицкая Земля',
    description:  'Уникальная архитектура, история и природа на всем протяжении маршрута в районе города Старица: пещеры, водопад, усадебные и купеческие постройки 16-17 века, церкви и монастырь.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover,
    track:         track
  }, {
    user_id:       2,
    title:        'К Пантелееву болоту',
    description:  'Прогулка по Конаковскому району Тверской области. Маршрут пролегает по приятным лесным и полевым дорожкам и подходит к Пантелееву болоту, где по осени можно набрать клюквы.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover,
    track:         track
  }, {
    user_id:       2,
    title:        'Менделеево',
    description:  'Маршрут возле Зеленограда по местам воинской славы войны 1941 г. Памятники в начале и в конце маршрута. От Штыков можно сделать радиальный выход к памятнику «Танк». От поселка ВНИИПП также можно сделать радиальный выход к рубежу 1941 г. На маршруте встречаются живописные заболоченные лесные озера.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover,
    track:         track
  }, {
    user_id:       2,
    title:        'Марфино кольцо',
    description:  'Маршрут удачно сочетает прогулку по лесам и полям с осмотром исторических и культурных достопримечательностей: научного городка института кормов им. Вильямса, усадьбы Марфино, музея народных промыслов в Федоскино, музея истории танка Т-34.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover,
    track:         track
  }, {
    user_id:       2,
    title:        'Южный Вандан',
    description:  'Маршрут на вершину горы Южный Вандан высотой 713 метров. Вершина является частью горного хребта Вандан в Хабаровском крае.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover,
    track:         track
  }
]

@routes.each do |params|
  r = Route.new(params)

  if r.save
    puts "Route #{r.title} created"
  else
    puts "Route #{r.title} not created"
  end
end

def random_route_id
  Route.offset(rand(Route.count)).first.id
end


# Create spot status
@statuses = [ 'активный', 'нужна проверка', 'неактивный' ]

# Create tag_list
@tag_list = ['#храм', '#здание', '#река', '#место для ночлега', '#кормушка для животных', '#панорамный вид', '#место для рыбалки', '#перекат', '#водопад', '#мост', '#плотина', '#заповедник', '#хвойный лес', '#заброшенное здание']

# Create random users
def random_users
  rand(2..5)
end

# Fake route covers
def upload_fake_spot_image
  uploader = ImageUploader.new(SpotImage.new, :image)
  # uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/genre/covers', '*')).sample))
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/assets/spot/images', '*')).sample))
  uploader
end

# Create spot
@spots = [
  {
    name:        'Абабковский монастырь',
    status:       0,
    description: 'Не доходя до монастыря можно найти небольшую часовню с родником. Абабковский православный женский монастырь Выксунской епархии Русской православной церкви. В настоящее время монастырь восстанавливается к первоначальному образу, но уже сейчас можно увидеть внешний облик красивого храма.',
    tag_list:     [3.times.map { @tag_list.sample }],
    route_id:     random_route_id,
    user_id:      random_users,
    latitude:     56.07072,
    longitude:    43.10256,
    spot_images_attributes: [ {image: upload_fake_spot_image}, {image: upload_fake_spot_image}, {image: upload_fake_spot_image} ]
  }, {
    name:        'река Кишма',
    status:       1,
    description: 'Здесь туристам предстоит переход через реку по трубам. Ширина Кишмы здесь не более 15 метров и глубина от 1 до 1,5 метров.',
    tag_list:     2.times.map { @tag_list.sample },
    route_id:     random_route_id,
    user_id:      random_users,
    latitude:     56.09047,
    longitude:    43.05308,
    spot_images_attributes: [ {image: upload_fake_spot_image}, {image: upload_fake_spot_image} ]
  }, {
    name:        'урочище Костино',
    status:       2,
    description: 'Отсюда открываются потрясающие виды на пойму Оки и бескрайний лес за рекой. А на месте поселения Костино, первое упоминание о котором датируется 15-ым веком, стоит крест и лежат каменные глыбы.',
    tag_list:     3.times.map { @tag_list.sample },
    route_id:     random_route_id,
    user_id:      random_users,
    latitude:     56.13747,
    longitude:    43.01523,
    spot_images_attributes: [ {image: upload_fake_spot_image}, {image: upload_fake_spot_image}, {image: upload_fake_spot_image} ]
  }, {
    name:        'река Ока',
    status:       0,
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:     4.times.map { @tag_list.sample },
    route_id:     random_route_id,
    user_id:      random_users,
    latitude:     56.10654,
    longitude:    43.03003,
    spot_images_attributes: [ {image: upload_fake_spot_image}, {image: upload_fake_spot_image} ]
  }, {
    name:        'г. Павлово',
    status:       0,
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:     5.times.map { @tag_list.sample },
    route_id:     random_route_id,
    user_id:      random_users,
    latitude:     55.964629,
    longitude:    43.064570,
    spot_images_attributes: [ {image: upload_fake_spot_image} ]
  }, {
    name:        'г. Горбатов',
    status:       0,
    user_id:      random_users,
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:    @tag_list.sample,
    route_id:     random_route_id,
    user_id:      User.all.sample.id,
    latitude:     56.130869,
    longitude:    43.062701,
    spot_images_attributes: [ {image: upload_fake_spot_image} ]
  }
]

@spots.each do |spot|
  s = Spot.new(spot)

  if s.save
    puts "Spot #{s.name} created"
  else
    puts "Spot #{s.name} not created"
  end
end

5.times do |n|
  @spots.each do |spot|
    # n начнётся с нуля, поэтому +1
    Spot.create(spot.merge(route_id: n+1))
  end
end

# Create comment
@comments = [
  {
    body: 'йо',
    route_id: random_route_id,
    user_id: User.all.sample.id
  }, {
    body: 'рэп',
    route_id: random_route_id,
    user_id: User.all.sample.id
  }, {
    body: 'код',
    route_id: random_route_id,
    user_id: User.all.sample.id
  }
]

@comments.each do |comment|
  c = Comment.new(comment)

  if c.save
    puts "Comment created"
  else
    puts "Comment not created"
  end
end
