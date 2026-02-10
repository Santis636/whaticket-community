import AppError from "../../errors/AppError";
import Contact from "../../models/Contact";
import Company from "../../models/Company";
import Ticket from "../../models/Ticket";

interface ExtraInfo {
  name: string;
  value: string;
}

interface Request {
  name: string;
  number: string;
  email?: string;
  profilePicUrl?: string;
  extraInfo?: ExtraInfo[];
  id: number;
  companyId: number;
  company: Company;
  address: string;
  addressComplement: string;
  document: string;
  zipCode: string;
  isGroup: boolean;
  createdAt: Date;
  createdBy: string;
  updatedAt: Date;
  updateBy: string;
  tickets: Ticket[];
}

const CreateContactService = async ({
  name,
  number,
  email = "",
  id,
  company,
  companyId,
  address,
  addressComplement,
  document,
  zipCode,
  updateBy,
  updatedAt,
  isGroup,
  createdAt,
  createdBy,
  tickets,
  profilePicUrl,
  extraInfo = []
}: Request): Promise<Contact> => {
  const numberExists = await Contact.findOne({
    where: { number }
  });

  if (numberExists) {
    throw new AppError("ERR_DUPLICATED_CONTACT");
  }

  const contact = await Contact.create(
    {
      name,
      number,
      email,
      extraInfo,
      id,
      company,
      companyId,
      address,
      addressComplement,
      document,
      zipCode,
      updateBy,
      updatedAt,
      isGroup,
      createdAt,
      createdBy,
      tickets,
      profilePicUrl
    },
    {
      include: ["extraInfo"]
    }
  );

  return contact;
};

export default CreateContactService;
