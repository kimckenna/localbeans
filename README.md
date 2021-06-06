# Local Beans 
## T2A2 - Marketplace App
#### Kimberly McKenna

### Website:
https://localbeans.herokuapp.com/

### Github Repository:
https://github.com/kimckenna/localbeans/tree/main

## PURPOSE

## SITEMAP

<p float="left" align="center">
  <img src="./docs/Local_Beans_Site_Map.png" alt="Local_Beans_Site_Map" />
</p>

## LOCAL BEANS ERD

<p float="left" align="center">
  <img src="./docs/Local_Beans_ERD_T2A2.png" alt="Local_Beans_ERD" />
</p>

## FINAL WEBSITE

#### Index Page

<p float="left" align="center">
  <img src="./docs/localbeans_screenshot_live_2.png" alt="index page desktop" />
</p>

#### Listing Page

<p float="left" align="center">
  <img src="./docs/localbeans_screenshot_live_8.png" alt="index page desktop" />
</p>

#### Show Listing Page

<p float="left" align="center">
  <img src="./docs/localbeans_screenshot_live_9.png" alt="index page desktop"/>
</p>

#### Reserve Page

<p float="left" align="center">
  <img src="./docs/localbeans_screenshot_live_7.png" alt="index page desktop" />
</p>

#### User Profile

<p float="left" align="center">
  <img src="./docs/localbeans_screenshot_live_6.png" alt="index page desktop" />
</p>

#### Business Profile

<p float="left" align="center">
  <img src="./docs/localbeans_screenshot_live_5.png" alt="index page desktop"/>
</p>

#### New Listing - Brands

<p float="left" align="center">
  <img src="./docs/localbeans_screenshot_live_4.png" alt="index page desktop"/>
</p>

#### New Listing - Edit

<p float="left" align="center">
  <img src="./docs/localbeans_screenshot_live_3.png" alt="index page desktop" />
</p>

## Model Relationships: Active Record Associations

```rb
class User < ApplicationRecord
  has_one :stockist, dependent: :destroy
  has_many :reservations, dependent: :destroy

  accepts_nested_attributes_for :stockist
end

class Stockist < ApplicationRecord
  belongs_to :user
  has_many :addresses, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :stockist_brands, dependent: :destroy
  has_many :brands, through: :stockist_brands, dependent: :destroy
  has_one :image
  
  accepts_nested_attributes_for :stockist_brands, :addresses
end

class Address < ApplicationRecord
  belongs_to :stockist
  has_many :listings, through: :stockist

  enum state: ['ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA']
end

class StockistBrand < ApplicationRecord
  belongs_to :brand
  belongs_to :stockist
end

class Brand < ApplicationRecord
	has_many :listings, dependent: :destroy
	has_many :stockist_brands, dependent: :destroy
	has_many :stockists, through: :stockist_brands, dependent: :destroy

	accepts_nested_attributes_for :stockist_brands
end

class Listing < ApplicationRecord
  belongs_to :stockist
  belongs_to :brand
  has_many :sizes, dependent: :destroy
  has_many :listing_grinds, dependent: :destroy
  has_many :grinds, through: :listing_grinds, dependent: :destroy
  has_many_attached :images

  accepts_nested_attributes_for :brand, :sizes, :listing_grinds

  enum bean_type: ['Single Origin', 'Mix Blend', 'Decaf']
end

class ListingGrind < ApplicationRecord
  belongs_to :grind
  belongs_to :listing
end

class Grind < ApplicationRecord
  has_many :listing_grinds, dependent: :destroy
  has_many :listings, through: :listing_grinds, dependent: :destroy
  has_many :reservations, dependent: :destroy
end

class Size < ApplicationRecord
  belongs_to :listing
  has_many :reservations, dependent: :destroy
end

class Reservation < ApplicationRecord
  belongs_to :size
  belongs_to :user
  belongs_to :grind
end
```

## Database Schema Design

As default all tables include a primary key id and: 
```
	created_at: datetime
	updated_at: datetime
```
All references, reference the attributes id as a foreign key for the model.

#### User

```
	first_name: string
	last_name: string
	email: string
	encrypted_password: string 
	reset_password_token: string
	reset_password_sent_at: datetime
	remember_created_at: datetime	
```

#### Stockist

```
	business_name: string
	abn: integer
	verified: boolean
	user: references 
```
*verified is included in schema but not currently being used due to time constraints -intention to have business verified if time allowed for admin implementation*

#### Address

```
	address_line1: string
	address_line2: string
	suburb: string
	state: integer
	postcode: integer
	stockist: references
```

#### StockistBrand

```
stockist: references
brand: references
```

#### Brand

```
	brand: string
```

#### Listing

```
	name: string
	origin: string 
	flavour_profile: text
	bean_type: integer
	description: text
	roast: string
	stockist: references
	brand: references
```

#### ListingGrind

```
	listing: references
	grind: references
```

#### Grind

```
	bean_grind: string
```

#### Size

```
	size: integer
	price: decimal
	active: boolean
```

#### Reservation

```
	quantity: integer
	total_price: decimal
	grind: references
	size: references
	user: references
```
*quantity & total_price are included in schema but not currently being used due to time constraints - intention to add quantity that could be reserved*

#### Active_Storage_Attachments

```
	name: string
	record_type: string
	record: references
	blob: references
```

#### Active_Storage_Blobs

```
	key: string
	filename: string
	content_type: string
	metadata: text
	byte_size: integer
	checksum: string
```

#### Roles

```
	name: string
	resource_type: string
	resource: references
```

*roles is included in schema but not currently being used due to time constraints - intention to add roles for user type and integrate admin*

#### Users_Roles

```
	user: references
	role: references
```

*user_roles is included in schema but not currently being used due to time constraints - intention to add roles for user type and integrate admin*