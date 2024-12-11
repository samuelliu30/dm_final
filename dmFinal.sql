CREATE TABLE employee (
    employee_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    hire_date DATE NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE store (
    store_id INT PRIMARY KEY NOT NULL,
    store_name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE shift (
    shift_id INT PRIMARY KEY NOT NULL,
    employee_id INT NOT NULL,
    store_id INT NOT NULL,
    shift_start DATETIME NOT NULL,
    shift_end DATETIME NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (store_id) REFERENCES store(store_id) ON DELETE CASCADE
);

CREATE TABLE landlord (
    landlord_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE rental_contract (
    contract_id INT PRIMARY KEY NOT NULL,
    store_id INT NOT NULL,
    landlord_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    rent FLOAT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES store(store_id) ON DELETE CASCADE,
    FOREIGN KEY (landlord_id) REFERENCES landlord(landlord_id) ON DELETE CASCADE
);

CREATE TABLE FoP (
    fop_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    commission_rate DECIMAL(10,2) NOT NULL
);

CREATE TABLE fop_contract (
    contract_id INT PRIMARY KEY NOT NULL,
    store_id INT NOT NULL,
    fop_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    commission_rate DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (store_id) REFERENCES store(store_id) ON DELETE CASCADE,
    FOREIGN KEY (fop_id) REFERENCES FoP(fop_id) ON DELETE CASCADE
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NULL,
    street VARCHAR(200) NULL,
    city VARCHAR(100) NULL,
    province VARCHAR(100) NULL,
    zip_code VARCHAR(10) NULL,
    phone_number VARCHAR(20) NULL
);

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY,
    name VARCHAR(100),
    purchase_date DATE,
    store_id INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

CREATE TABLE raw_materials (
    material_id INT PRIMARY KEY,
    material_name VARCHAR(100),
    unit VARCHAR(10)
);

CREATE TABLE recipe (
    recipe_id INT PRIMARY KEY,
    material_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (material_id) REFERENCES raw_materials(material_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE `order` (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    fop_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (fop_id) REFERENCES FoP(fop_id) ON DELETE CASCADE
);

CREATE TABLE order_line (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES `order`(order_id) ON DELETE CASCADE,
    PRIMARY KEY (order_id, product_id)
);

CREATE TABLE membership (
    membership_id INT PRIMARY KEY,
    customer_id INT,
    balance FLOAT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    description VARCHAR(200) NULL
);

CREATE TABLE supplier_order (
    s_orderId INT PRIMARY KEY,
    supplier_id INT NOT NULL,
    store_id INT NOT NULL,
    equipment_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id) ON DELETE CASCADE,
    FOREIGN KEY (store_id) REFERENCES store(store_id) ON DELETE CASCADE,
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id) ON DELETE CASCADE
);

CREATE TABLE store_inventory (
    material_id INT NOT NULL,
    store_id INT NOT NULL,
    quantity INT NOT NULL,
    last_updated DATE,
    FOREIGN KEY (material_id) REFERENCES raw_materials(material_id) ON DELETE CASCADE,
    FOREIGN KEY (store_id) REFERENCES store(store_id) ON DELETE CASCADE,
    PRIMARY KEY (material_id, store_id)
);

CREATE TABLE menu (
    menu_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT,
    FOREIGN KEY (store_id) REFERENCES store(store_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE,
    PRIMARY KEY (menu_id, store_id)
);

