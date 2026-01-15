import {
  Table,
  Column,
  CreatedAt,
  UpdatedAt,
  Model,
  DataType,
  BeforeCreate,
  BeforeUpdate,
  PrimaryKey,
  AutoIncrement,
  Default,
  HasMany,
  BelongsToMany,
  ForeignKey,
  BelongsTo
} from "sequelize-typescript";
import { hash, compare } from "bcryptjs";
import Ticket from "./Ticket";
import Queue from "./Queue";
import UserQueue from "./UserQueue";
import Whatsapp from "./Whatsapp";
import Role from "./Role";
import Company from "./Company";
import { company } from "faker";

// adicionar o vinculo de permissão por usuario
@Table
class User extends Model<User> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;

  @Column
  name: string;

  @Column
  email: string;

  @Column(DataType.VIRTUAL)
  password: string;

  @Column
  passwordHash: string;

  @Default(0)
  @Column
  tokenVersion: number;

  // @Default("admin")
  // @Column
  // profile: string; //parte antiga do codigo com o perfil sendo apenas como profile

  @ForeignKey(() => Role)
  @Column
  roleId: number;

  @BelongsTo(() => Role)
  role: Role; //campo para pegar os novos perfis de permissão

  @ForeignKey(() => Company)
  @Column
  companyId: number;

  @BelongsTo(() => Company)
  company: Company; //vinculo com o cliente interno chamado de compania 

  @ForeignKey(() => Whatsapp)
  @Column
  whatsappId: number;

  @BelongsTo(() => Whatsapp)
  whatsapp: Whatsapp;

  @CreatedAt
  createdAt: Date;

  @UpdatedAt
  updatedAt: Date;

  @HasMany(() => Ticket)
  tickets: Ticket[];

  @BelongsToMany(() => Queue, () => UserQueue)
  queues: Queue[];

  @BeforeUpdate
  @BeforeCreate
  static hashPassword = async (instance: User): Promise<void> => {
    if (instance.password) {
      instance.passwordHash = await hash(instance.password, 8);
    }
  };

  public checkPassword = async (password: string): Promise<boolean> => {
    return compare(password, this.getDataValue("passwordHash"));
  };
}

export default User;
