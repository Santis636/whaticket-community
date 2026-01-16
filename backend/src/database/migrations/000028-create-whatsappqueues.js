// src/migrations/000028-create-whatsappqueues.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('WhatsappQueues', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
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
      queueId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Queues',
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

    await queryInterface.addIndex('WhatsappQueues', ['whatsappId', 'queueId'], {
      unique: true,
      name: 'whatsappqueues_whatsapp_queue_unique',
    });

    await queryInterface.addIndex('WhatsappQueues', ['whatsappId']);
    await queryInterface.addIndex('WhatsappQueues', ['queueId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('WhatsappQueues', 'whatsappqueues_whatsapp_queue_unique');
    await queryInterface.dropTable('WhatsappQueues');
  },
};