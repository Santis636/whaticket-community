// src/migrations/000014-create-queues.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Queues', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      name: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
      },
      color: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
      },
      greetingMessage: {
        type: Sequelize.TEXT,
        allowNull: true,
      },
      companyId: {
        type: Sequelize.INTEGER,
        allowNull: true,
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

    await queryInterface.addIndex('Queues', ['companyId', 'name'], {
      unique: true,
      name: 'queues_company_name_unique',
    });

    await queryInterface.addIndex('Queues', ['companyId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('Queues', 'queues_company_name_unique');
    await queryInterface.dropTable('Queues');
  },
};