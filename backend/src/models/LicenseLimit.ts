import { AutoIncrement, BelongsTo, Column, CreatedAt, Default, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import Feature from "./Feature";
import License from "./License";

@Table
class LicenseLimit extends Model<LicenseLimit> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @ForeignKey(() => License)
    @Column
    licenseId: number;

    @Column
    resource: string; // users, whatsapps, queues

    @Column
    limit: number;

    @BelongsTo(() => License)
    license: License;

    @Column
    createdBy: string;

    @CreatedAt
    createdAt: Date;

    @Column
    updatedBy: string;

    @UpdatedAt
    updatedAt: Date;
}
export default LicenseLimit;