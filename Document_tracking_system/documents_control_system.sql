Drop Database If exists `Documents_Control_System`;
CREATE Database `Documents_Control_System`;
use `Documents_Control_System`;

CREATE TABLE `user` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `employee` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `documents` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`document_type` TEXT NOT NULL,
	`reciept_date` DATETIME,
	`recipt_number` INT,
	`document_status` INT,
	CHECK (document_status<=1), -- 0 means circulated to, 1 means mailed externally
	`circulated_to` INT,
	`mailing_address_code` VARCHAR(255),
	PRIMARY KEY (`id`),
	FOREIGN KEY (`circulated_to`) REFERENCES `employee`(`id`)
);

CREATE INDEX idx_on_document_status
ON documents (document_status);
CREATE INDEX idx_on_circulated_to
ON documents (circulated_to);
CREATE INDEX idx_on_reciept_date
ON documents (reciept_date);


CREATE TABLE `drafts` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`document_id` INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`document_id`) REFERENCES `documents`(`id`)
);

CREATE TABLE `copies` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`draft_id` INT NOT NULL,
	`circulated_to` INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`draft_id`) REFERENCES `drafts`(`id`),
	FOREIGN KEY (`circulated_to`) REFERENCES `employee`(`id`)
);

CREATE TABLE `employee_has_document` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`employee_id` INT NOT NULL,
	`document_id` INT NOT NULL,
	`changer_id` INT NOT NULL,
	`created_at` DATETIME NOT NULL,
	`updated_at` DATETIME,
	`ended_at` DATETIME,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`),
	FOREIGN KEY (`document_id`) REFERENCES `documents`(`id`),
	FOREIGN KEY (`changer_id`) REFERENCES `user`(`id`)
);

CREATE INDEX idx_changer_id
ON employee_has_document (changer_id);
CREATE INDEX idx_updated_at
ON employee_has_document (updated_at);
