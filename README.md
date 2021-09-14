### Challenge #2: Contact options

In this ruby challenge, please take care to provide clean & optimised code.

1. Refer to the below [Contact Options doc](https://www.notion.so/Contact-options-286cdcda3d614b8c880c8d7619a404a4). Pay close attention to the contacts given, how each contact ranking is calculated, and how to decide which option to show for each contact, e.g. Offer a `VIP` or `free` introduction. Hint: there can only be one contact who will be offered a `VIP` introduction.

   [Contact options](https://www.notion.so/Contact-options-286cdcda3d614b8c880c8d7619a404a4)

2. Create a `ContactOptions` class where it should:
  - Return all contacts, ordered alphabetically by their **last** name, and then by their **first** name
  - For each contact, also include their calculated ranking and contact option (`VIP` or `free`)
3. Create one or more unit tests that will test the above logic.

### **Contacts**


[
	{
		name: 'John Doe',
		email: 'john@brdg.app',
		introsOffered: {free: 3, vip: 0}
	},
	{
		name: 'Billy Ray Jenkins',
		email: 'billy.jenkins@gmail.com',
		introsOffered: {free: 5, vip: 0}
	},
	{
		name: 'Jenny Baggins',
		email: 'jeni@x.com',
		introsOffered: {free: 5, vip: 1}
	},
	{
		name: 'Lloyd Banks',
		email: 'lloyd@banks.com',
		introsOffered: {free: 0, vip: 0}
	},
	{
		name: 'BA Lewis',
		email: 'ba.lewis@outlook.com',
		introsOffered: {free: 8, vip: 0}
	},
	{
		name: 'John Johnson',
		email: 'jj@z.com',
		introsOffered: {free: 4, vip: 0}
	},
	{
		name: 'Adam Johnson',
		email: 'aj@z.com',
		introsOffered: {free: 4, vip: 0}
	},
	{
		name: 'Joey Simpson',
		email: 'joey@hotmail.com',
		introsOffered: {free: 9, vip: 1}
	},
	{
		name: 'Penny Smith',
		email: 'penny@smith.com',
		introsOffered: {free: 2, vip: 0}
	}
]

### Contact ranking calculation

- All contacts have a base ranking of `3`.
- If the contact does NOT have a personal email (e.g `[gmail.com](http://gmail.com)`, `[hotmail.com](http://hotmail.com)` or `outlook.com`), add `2` to the ranking.
- Add `1` to the ranking for EACH intro already offered.

### Contact options

- `Offer VIP introduction`
  - If contact has the highest ranking of all contacts who have NOT yet been offered a VIP intro
- `Offer free introduction`
  - If contact does NOT have the highest ranking of all contacts who have NOT yet been offered a VIP intro
  - OR has already been offered one or more VIP intros