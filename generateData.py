import random
import string
import datetime

# Define a global variable for the number of rows to generate
NUM_ROWS = 10

def generate_data():
    with open('generated_data.sql', 'w') as sql_file:  # Open a file to write SQL statements
        for i in range(1, NUM_ROWS):
            # Generate data for employee table
            employee_id = i
            first_name = ''.join(random.choices(string.ascii_letters + string.digits, k=5))
            last_name = ''.join(random.choices(string.ascii_letters + string.digits, k=5))
            email = f"{first_name.lower()}@example.com"
            phone_number = ''.join(random.choices(string.digits, k=10))
            hire_date = datetime.date.today().strftime('%Y-%m-%d')
            job_title = "barista"
            salary = random.randint(30000, 80000)

            # Write SQL insert for employee
            sql_file.write(f"INSERT INTO employee (employee_id, first_name, last_name, email, phone_number, hire_date, job_title, salary) VALUES ({employee_id}, '{first_name}', '{last_name}', '{email}', '{phone_number}', '{hire_date}', '{job_title}', {salary});\n")

            # Generate data for store table
            store_id = i
            store_name = f"Store {i}"
            address = f"Address {i}"
            phone_number = ''.join(random.choices(string.digits, k=10))

            # Write SQL insert for store
            sql_file.write(f"INSERT INTO store (store_id, store_name, address, phone_number) VALUES ({store_id}, '{store_name}', '{address}', '{phone_number}');\n")

            # Generate data for shift table
            shift_id = i
            employee_id = i
            store_id = i
            shift_start = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            shift_end = (datetime.datetime.now() + datetime.timedelta(hours=8)).strftime('%Y-%m-%d %H:%M:%S')

            # Generate data for landlord table
            landlord_id = i
            first_name = ''.join(random.choices(string.ascii_letters + string.digits, k=5))
            last_name = ''.join(random.choices(string.ascii_letters + string.digits, k=5))
            email = f"{first_name.lower()}@example.com"
            phone_number = ''.join(random.choices(string.digits, k=10))

            # Generate data for rental_contract table
            contract_id = i
            store_id = i
            landlord_id = i
            start_date = datetime.date.today().strftime('%Y-%m-%d')
            end_date = (datetime.date.today() + datetime.timedelta(days=365)).strftime('%Y-%m-%d')
            rent = random.randint(1000, 5000)

            # Generate data for FoP table
            fop_id = i
            name = f"FoP {i}"
            commission_rate = random.uniform(0, 0.2)

            # Generate data for fop_contract table
            contract_id = i
            store_id = i
            fop_id = i
            start_date = datetime.date.today().strftime('%Y-%m-%d')
            end_date = (datetime.date.today() + datetime.timedelta(days=365)).strftime('%Y-%m-%d')
            commission_rate = random.uniform(0, 0.2)

            # Generate data for customer table
            customer_id = i
            first_name = ''.join(random.choices(string.ascii_letters + string.digits, k=5))
            last_name = ''.join(random.choices(string.ascii_letters + string.digits, k=5))
            phone = ''.join(random.choices(string.digits, k=10))
            email = f"{first_name.lower()}@example.com"
            street = f"Street {i}"
            city = f"City {i}"
            province = f"Province {i}"
            zip_code = ''.join(random.choices(string.digits, k=6))
            phone_number = ''.join(random.choices(string.digits, k=10))

            # Generate data for product table
            product_id = i
            product_name = f"Product {i}"
            product_price = random.randint(4, 7) + 0.99

            # Generate data for equipment table
            equipment_id = i
            name = f"Equipment {i}"
            purchase_date = datetime.date.today().strftime('%Y-%m-%d')
            store_id = i

            # Generate data for raw_materials table
            material_id = i
            material_name = f"Material {i}"
            unit = "kg"

            # Generate data for recipe table
            recipe_id = i
            material_id = i
            product_id = i
            quantity = random.randint(1, 10)

            # Generate data for order table
            order_id = i
            customer_id = i
            order_date = datetime.date.today().strftime('%Y-%m-%d')

            # Generate data for order_line table
            order_id = i
            product_id = i
            quantity = random.randint(1, 10)

            # Generate data for membership table
            membership_id = i
            customer_id = i
            balance = random.uniform(0, 1000)
            start_date = datetime.date.today().strftime('%Y-%m-%d')
            end_date = (datetime.date.today() + datetime.timedelta(days=365)).strftime('%Y-%m-%d')

            # Generate data for supplier table
            supplier_id = i
            supplier_name = f"Supplier {i}"
            description = f"Description {i}"

            # Generate data for supplier_order table
            s_orderId = i
            supplier_id = i
            store_id = i
            equipment_id = i
            quantity = random.randint(1, 10)
            order_date = datetime.date.today().strftime('%Y-%m-%d')
            price = random.uniform(100, 1000)

            # Generate data for store_inventory table
            material_id = i
            store_id = i
            quantity = random.randint(1, 100)
            last_updated = datetime.date.today().strftime('%Y-%m-%d')

            # Write SQL insert for shift
            sql_file.write(f"INSERT INTO shift (shift_id, employee_id, store_id, shift_start, shift_end) VALUES ({shift_id}, {employee_id}, {store_id}, '{shift_start}', '{shift_end}');\n")

            # Write SQL insert for landlord
            sql_file.write(f"INSERT INTO landlord (landlord_id, first_name, last_name, email, phone_number) VALUES ({landlord_id}, '{first_name}', '{last_name}', '{email}', '{phone_number}');\n")

            # Write SQL insert for rental_contract
            sql_file.write(f"INSERT INTO rental_contract (contract_id, store_id, landlord_id, start_date, end_date, rent) VALUES ({contract_id}, {store_id}, {landlord_id}, '{start_date}', '{end_date}', {rent});\n")

            # Write SQL insert for FoP
            sql_file.write(f"INSERT INTO fop (fop_id, name, commission_rate) VALUES ({fop_id}, '{name}', {commission_rate});\n")

            # Write SQL insert for fop_contract
            sql_file.write(f"INSERT INTO fop_contract (contract_id, store_id, fop_id, start_date, end_date, commission_rate) VALUES ({contract_id}, {store_id}, {fop_id}, '{start_date}', '{end_date}', {commission_rate});\n")

            # Write SQL insert for customer
            sql_file.write(f"INSERT INTO customer (customer_id, first_name, last_name, phone, email, street, city, province, zip_code) VALUES ({customer_id}, '{first_name}', '{last_name}', '{phone}', '{email}', '{street}', '{city}', '{province}', '{zip_code}');\n")

            # Write SQL insert for product
            sql_file.write(f"INSERT INTO product (product_id, product_name, price) VALUES ({product_id}, '{product_name}', {product_price});\n")

            # Write SQL insert for equipment
            sql_file.write(f"INSERT INTO equipment (equipment_id, name, purchase_date, store_id) VALUES ({equipment_id}, '{name}', '{purchase_date}', {store_id});\n")

            # Write SQL insert for raw_materials
            sql_file.write(f"INSERT INTO raw_materials (material_id, material_name, unit) VALUES ({material_id}, '{material_name}', '{unit}');\n")

            # Write SQL insert for recipe
            sql_file.write(f"INSERT INTO recipe (recipe_id, material_id, product_id, quantity) VALUES ({recipe_id}, {material_id}, {product_id}, {quantity});\n")

            # Write SQL insert for order
            sql_file.write(f"INSERT INTO `order` (order_id, customer_id, order_date) VALUES ({order_id}, {customer_id}, '{order_date}');\n")

            # Write SQL insert for order_line
            sql_file.write(f"INSERT INTO order_line (order_id, product_id, quantity) VALUES ({order_id}, {product_id}, {quantity});\n")

            # Write SQL insert for membership
            sql_file.write(f"INSERT INTO membership (membership_id, customer_id, balance, start_date, end_date) VALUES ({membership_id}, {customer_id}, {balance}, '{start_date}', '{end_date}');\n")

            # Write SQL insert for supplier
            sql_file.write(f"INSERT INTO supplier (supplier_id, supplier_name, description) VALUES ({supplier_id}, '{supplier_name}', '{description}');\n")

            # Write SQL insert for supplier_order
            sql_file.write(f"INSERT INTO supplier_order (s_orderId, supplier_id, store_id, equipment_id, quantity, order_date, price) VALUES ({s_orderId}, {supplier_id}, {store_id}, {equipment_id}, {quantity}, '{order_date}', {price});\n")

            # Write SQL insert for store_inventory
            sql_file.write(f"INSERT INTO store_inventory (material_id, store_id, quantity, last_updated) VALUES ({material_id}, {store_id}, {quantity}, '{last_updated}');\n")

            # Insert data into the database
            # TODO: Insert data into the database

generate_data()
