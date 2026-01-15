import { AutoIncrement, BelongsTo, Column, CreatedAt, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import Role from "./Role";
import Permission from "./Permission";

@Table
class RolePermission extends Model<RolePermission> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @ForeignKey(() => Role)
    @Column
    roleId: number;

    @ForeignKey(() => Permission)
    @Column
    permissionId: number;

    @BelongsTo(() => Role)
    role: Role;

    @BelongsTo(() => Permission)
    permission: Permission;

    @Column
    createdBy: string;

    @CreatedAt
    createdAt: Date;

    @Column
    updatedBy: string;

    @UpdatedAt
    updatedAt: Date;
}