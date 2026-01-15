import {
  Table,
  Column,
  CreatedAt,
  UpdatedAt,
  Model,
  ForeignKey,
  BelongsTo,
  PrimaryKey,
  AutoIncrement
} from "sequelize-typescript";
import Queue from "./Queue";
import Whatsapp from "./Whatsapp";

@Table
class WhatsappQueue extends Model<WhatsappQueue> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;
  
  @ForeignKey(() => Whatsapp)
  @Column
  whatsappId: number;

  @ForeignKey(() => Queue)
  @Column
  queueId: number;

  @CreatedAt
  createdAt: Date;

  @UpdatedAt
  updatedAt: Date;

  @BelongsTo(() => Queue)
  queue: Queue;
}

export default WhatsappQueue;
