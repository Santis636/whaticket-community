// src/migrations/000026-create-contactcustomfields.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('ContactCustomFields', {
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
      value: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      contactId: {
        type: Sequelize.INTEGER,
        allowNull: true,
        references: {
          model: 'Contacts',
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

    await queryInterface.addIndex('ContactCustomFields', ['contactId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('ContactCustomFields');
  },
};