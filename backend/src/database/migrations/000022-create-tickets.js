// src/migrations/000022-create-tickets.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Tickets', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      status: {
        type: Sequelize.STRING,
        defaultValue: 'pending',
        allowNull: true,
      },
      unreadMessages: {
        type: Sequelize.INTEGER,
        allowNull: true,
      },
      lastMessage: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      isGroup: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
        allowNull: true,
      },
      userId: {
        type: Sequelize.INTEGER,
        allowNull: true,
        references: {
          model: 'Users',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
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
      whatsappId: {
        type: Sequelize.INTEGER,
        allowNull: true,
        references: {
          model: 'Whatsapps',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      queueId: {
        type: Sequelize.INTEGER,
        allowNull: true,
        references: {
          model: 'Queues',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
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

    await queryInterface.addIndex('Tickets', ['contactId']);
    await queryInterface.addIndex('Tickets', ['userId']);
    await queryInterface.addIndex('Tickets', ['whatsappId']);
    await queryInterface.addIndex('Tickets', ['queueId']);
    await queryInterface.addIndex('Tickets', ['status']);
    await queryInterface.addIndex('Tickets', ['isGroup']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Tickets');
  },
};