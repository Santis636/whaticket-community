// src/migrations/000009-create-contacts.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Contacts', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      name: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      number: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      companyId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Companies',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      email: {
        type: Sequelize.STRING,
        allowNull: false,
        defaultValue: '',
      },
      address: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      document: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      zipCode: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      addressComplement: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      profilePicUrl: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      isGroup: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
        allowNull: true,
      },
      createdBy: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      createdAt: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
      updateBy: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      updatedAt: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
    });

    await queryInterface.addIndex('Contacts', ['companyId', 'number'], {
      unique: true,
      name: 'contacts_company_number_unique',
    });

    await queryInterface.addIndex('Contacts', ['companyId']);
    await queryInterface.addIndex('Contacts', ['number']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('Contacts', 'contacts_company_number_unique');
    await queryInterface.dropTable('Contacts');
  },
};