# README

## users table
|Column               |Type   |Options                     |
|---------------------|-------|----------------------------|
|nickname             |string |null: false                 |
|email                |string |null: false, unique: true   |
|encrypted_password   |string |null: false, default:""     |
|password_confirmation|string |null: false                 |
|provider             |string |null: false, default:"email"|
|uid                  |string |null: false, default:""     |
|tokens               |text   |                            |

### Association
- has_one :amount
- has_many :savings

## amounts table
|Column               |Type       |Options                       |
|---------------------|-----------|------------------------------|
|total_amount         |integer    |null: false                   |
|user                 |references |null: false, foreign_key: true|

### Association
- belongs_to :user


## savings table
|Column               |Type       |Options                       |
|---------------------|-----------|------------------------------|
|save_amount          |integer    |null: false                   |
|user                 |references |null: false, foreign_key: true|

### Association
- belongs_to :user
