class Gender < ActiveHash::Base
  self.data = [
    {id:0,name: '男性'},{id:1,name: '女性'},{id:2,name: 'どちらでもない'}
  ]
end