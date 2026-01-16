// src/migrations/000023-create-messages.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Messages', {
      id: {
        type: Sequelize.STRING,
        primaryKey: true,
        allowNull: false,
      },
      ack: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
        allowNull: true,
      },
      read: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
        allowNull: true,
      },
      fromMe: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
        allowNull: true,
      },
      body: {
        type: Sequelize.TEXT,
        allowNull: true,
      },
      mediaUrl: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      mediaType: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      isDeleted: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
        allowNull: true,
      },
      quotedMsgId: {
        type: Sequelize.STRING,
        allowNull: true,
        references: {
          model: 'Messages',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
      },
      ticketId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Tickets',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      contactId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Contacts',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      createdAt: {
        type: Sequelize.DATE(6),
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
      updatedAt: {
        type: Sequelize.DATE(6),
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
    });

    await queryInterface.addIndex('Messages', ['ticketId']);
    await queryInterface.addIndex('Messages', ['contactId']);
    await queryInterface.addIndex('Messages', ['quotedMsgId']);
    await queryInterface.addIndex('Messages', ['createdAt']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Messages');
  },
};