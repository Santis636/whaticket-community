// src/migrations/000016-create-users.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Users', {
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
      email: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      passwordHash: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      tokenVersion: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
        allowNull: true,
      },
      roleId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Roles',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
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
      whatsappId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Whatsapps',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      createdBy: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      createdAt: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
      updatedBy: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      updatedAt: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
    });

    await queryInterface.addIndex('Users', ['companyId', 'email'], {
      unique: true,
      name: 'users_company_email_unique',
    });

    await queryInterface.addIndex('Users', ['companyId']);
    await queryInterface.addIndex('Users', ['roleId']);
    await queryInterface.addIndex('Users', ['whatsappId']);
    await queryInterface.addIndex('Users', ['email']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('Users', 'users_company_email_unique');
    await queryInterface.dropTable('Users');
  },
};