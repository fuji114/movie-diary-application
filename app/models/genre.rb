class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アクション' },
    { id: 3, name: 'ＳＦ' },
    { id: 4, name: 'コメディ' },
    { id: 5, name: 'サスペンス' },
    { id: 6, name: 'ホラー' },
    { id: 7, name: 'ミステリー' },
    { id: 8, name: 'キッズ' },
    { id: 9, name: '恋愛' },
    { id: 10, name: '青春' },
    { id: 11, name: 'ファミリー' },
    { id: 12, name: 'スポーツ' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :movies
end
