// src/migrations/000015-create-whatsapps.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Whatsapps', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      name: {
        type: Sequelize.TEXT,
        allowNull: true,
        unique: true,
      },
      session: {
        type: Sequelize.TEXT,
        allowNull: true,
      },
      qrcode: {
        type: Sequelize.TEXT,
        allowNull: true,
      },
      status: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      battery: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      plugged: {
        type: Sequelize.BOOLEAN,
        allowNull: true,
      },
      retries: {
        type: Sequelize.INTEGER,
        allowNull: true,
      },
      greetingMessage: {
        type: Sequelize.TEXT,
        allowNull: true,
      },
      farewellMessage: {
        type: Sequelize.TEXT,
        allowNull: true,
      },
      isDefault: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
        allowNull: true,
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
      createdAt: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
      updatedAt: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
    });

    await queryInterface.addIndex('Whatsapps', ['companyId', 'name'], {
      unique: true,
      name: 'whatsapps_company_name_unique',
    });

    await queryInterface.addIndex('Whatsapps', ['companyId']);
    await queryInterface.addIndex('Whatsapps', ['status']);
    await queryInterface.addIndex('Whatsapps', ['isDefault']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('Whatsapps', 'whatsapps_company_name_unique');
    await queryInterface.dropTable('Whatsapps');
  },
};